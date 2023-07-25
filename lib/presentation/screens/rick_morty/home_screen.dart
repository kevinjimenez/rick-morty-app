import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
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
          return InkWell(
            onTap: () {
              print('object');
            },
            child: ListTile(
              title: Text(character.name),
              subtitle: _CharacterStatus(character: character),
              leading: _CharacterImage(character: character),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.abc,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.abc,
            ),
            label: ''),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.abc,
            ),
            label: ''),
      ]),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeIn(
          child: Image.network(
        character.image,
        // loadingBuilder: (context, child, loadingProgress) {
        //   if (loadingProgress != null) {
        //     return const Center(
        //       child: CircularProgressIndicator(
        //         strokeWidth: 2,
        //       ),
        //     );
        //   }
        //   return child;
        // },
      )),
    );
  }
}

class _CharacterStatus extends StatelessWidget {
  const _CharacterStatus({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  Color colorStatus(String status) {
    switch (status) {
      case 'Alive':
        return Colors.green;

      case 'Dead':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 5,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          BounceInDown(
            from: 15,
            child: Icon(
              Icons.circle,
              color: colorStatus(character.status),
              size: 15,
            ),
          ),
          Text(character.status)
        ]);
  }
}
