import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/presentation/providers/characters_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _HomeView();
  }
}

class _HomeView extends ConsumerStatefulWidget {
  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(characterRickMortyProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final characters = ref.watch(characterRickMortyProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return Text(character.name);
        },
      ),
    );
  }
}
