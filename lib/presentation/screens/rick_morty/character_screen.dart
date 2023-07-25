import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.characterId),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _CharacterNameAndImage(character: character),
              const SizedBox(
                height: 30,
              ),
              _CharacterAbout(character: character),
              const SizedBox(
                height: 40,
              ),
              _CharacterEpisodes(character: character)
            ],
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
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeIn(child: Image.network(character.image)))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    character.name,
                    style: textStyle.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.favorite_border_rounded),
                  onPressed: () {},
                )
              ]),
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
          style: TextStyle(fontSize: 20),
        ),
        _CharacterInfo(label: 'Gender', text: character.gender),
        _CharacterInfo(
          label: 'Species',
          text: character.species,
        )
      ],
    );
  }
}

class _CharacterInfo extends StatelessWidget {
  final String label;
  final String text;
  const _CharacterInfo({
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Wrap(
        spacing: 10,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(text),
        ],
      ),
    );
  }
}

class _CharacterEpisodes extends StatelessWidget {
  final CharacterEntity character;

  const _CharacterEpisodes({required this.character});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
