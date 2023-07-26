import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/config/helpers/change_status.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/presentation/providers/character_provider.dart';

class CharacterScreen extends ConsumerStatefulWidget {
  final String characterId;

  const CharacterScreen({super.key, required this.characterId});

  @override
  CharacterScreenState createState() => CharacterScreenState();
}

class CharacterScreenState extends ConsumerState<CharacterScreen> {
  @override
  void initState() {
    super.initState();
    ref
        .read(characterRickMortyProvider.notifier)
        .loadCharacterById(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    final character = ref.watch(characterRickMortyProvider)[widget.characterId];

    if (character == null) {
      return Container(
        width: double.infinity,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.favorite_border_rounded,
                // size: 40,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CharacterNameAndImage(character: character),
                const SizedBox(
                  height: 30,
                ),
                _CharacterAbout(character: character),
                const SizedBox(
                  height: 30,
                ),
                _CharacterEpisodes(character: character),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}

class _CharacterNameAndImage extends StatelessWidget {
  final CharacterEntity character;

  const _CharacterNameAndImage({
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeIn(
                    child: Image.network(
                  character.image,
                  height: 225,
                )))),
        Text(
          character.name,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 5,
          children: [
            FadeIn(
              child: Icon(
                Icons.circle,
                color: ChangeStatus.color(character.status),
                size: 15,
              ),
            ),
            Text(
              character.status,
              style: const TextStyle(fontSize: 15),
            )
          ],
        )
      ],
    );
  }
}

class _CharacterAbout extends StatelessWidget {
  final CharacterEntity character;

  const _CharacterAbout({required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About the character',
          style: TextStyle(fontSize: 25),
        ),
        _CharacterInfo(label: 'Gender', text: character.gender, onClick: null,),
        _CharacterInfo(
          label: 'Species',
          text: character.species,
          onClick: null,
        ),
        _CharacterInfo(
          label: 'Location',
          text: character.location.name,
          onClick: () {
            print(character.location.url);
            // Modal dull screen
            // Navigator.of(context).push(CupertinoPageRoute(
            //   fullscreenDialog: true,
            //   builder: (context) => AaaScreen(),));
          },
        ),
        _CharacterInfo(
          label: 'Origin',
          text: character.origin.name,
          onClick: () {
            print(character.origin.url);
          },
        ),
      ],
    );
  }
}

class _CharacterInfo extends StatelessWidget {
  final String label;
  final String text;
  final void Function()? onClick;

  const _CharacterInfo({required this.label, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      onTap: onClick,
    );
  }
}

class _CharacterEpisodes extends StatelessWidget {
  final CharacterEntity character;

  const _CharacterEpisodes({required this.character});

  void openDialogo(BuildContext context, String episode) {
    showDialog(
        barrierDismissible: false, // si da tocu duera del dialo no se cierra
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Episodio No $episode'),
              
              content: const Text(
                  'Veniam sint adipisicing pariatur reprehenderit in dolore dolore eiusmod voluptate ad non irure cupidatat culpa. Cupidatat commodo anim occaecat commodo dolor ea id mollit aute. Pariatur occaecat quis dolore aliqua officia id culpa ea magna eu ipsum. Nostrud pariatur sunt enim incididunt labore laboris esse. Ad in nostrud laborum reprehenderit do commodo ea ut dolor excepteur tempor amet. Aliqua reprehenderit do culpa ipsum dolor.'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Episodes list',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 5,
            spacing: 30,
            children: [
              ...character.episode.map((episodie) {
                final no = episodie.split('/').last;
                return FilledButton.tonal(
                  child: Text(no),
                  onPressed: () {
                    openDialogo(context, no);
                  },
                );
              })
            ],
          ),
        )
      ],
    );
  }
}
