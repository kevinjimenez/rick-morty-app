import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/presentation/providers/locations_provider.dart';

class LocationScreen extends ConsumerStatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends ConsumerState<LocationScreen> {
  final scrollController = ScrollController();


  @override
  void initState() {
    super.initState();
    ref.read(locationsRickMortyProvider.notifier).loadNextPage();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        ref.read(locationsRickMortyProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void deactivate() {
    scrollController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    final locations = ref.watch(locationsRickMortyProvider);
    return Scaffold(
      body: ListView.builder(
        controller: scrollController,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: Text(location.name),
            subtitle: Text('${location.type} - ${location.dimension}'),
          );
        },
      ),
    );
  }
}
