import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      return const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
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
                child: FadeIn(child: Image.network(character.image, height: 225,)))),
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
        _CharacterInfo(label: 'Gender', text: character.gender),
        _CharacterInfo(
          label: 'Species',
          text: character.species,
        ),
        _CharacterInfo(
          label: 'Location',
          text: character.location.name,
        ),
        _CharacterInfo(
          label: 'Origin',
          text: character.origin.name,
        ),
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
    return ListTile(
      dense: true,
      // horizontalTitleGap: 0,
      // minVerticalPadding: 0,
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
      subtitle: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5),
      child: Wrap(
        spacing: 10,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Episodes list',
          style: TextStyle(fontSize: 25),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          children: [
            ...character.episode.map((episodie) => FilledButton.tonal(
                  child: Text(episodie.split('/').last),
                  onPressed: () {},
                ))
          ],
        )
      ],
    );
  }
}
