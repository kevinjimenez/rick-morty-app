import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/presentation/providers/episodes_provider.dart';
import 'package:rick_morty_app/presentation/providers/theme/theme_provider.dart';

class EpisodeScreen extends ConsumerStatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  EpisodeScreenState createState() => EpisodeScreenState();
}

class EpisodeScreenState extends ConsumerState<EpisodeScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(episodesRickMortyProvider.notifier).loadNextPage();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        ref.read(episodesRickMortyProvider.notifier).loadNextPage();
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
    final isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    final locations = ref.watch(episodesRickMortyProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes list'),
        leading: IconButton(
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              icon: Icon(isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkmode();
              })
        ],
      ),
      body: ListView.builder(
        controller: scrollController,
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return ListTile(
            leading: const Icon(Icons.live_tv_rounded),
            title: Text(location.name),
            subtitle: Text(location.episode),
            trailing: Text(
              location.airDate,
            ),
          );
        },
      ),
    );
  }
}
