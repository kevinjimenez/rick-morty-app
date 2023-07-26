import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/config/helpers/change_status.dart';
import 'package:rick_morty_app/domian/entities/character_entity.dart';
import 'package:rick_morty_app/presentation/providers/characters_provider.dart';
import 'package:rick_morty_app/presentation/providers/initial_loader_provider.dart';
import 'package:rick_morty_app/presentation/widgets/shared/full_screen_loader.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(charactersRickMortyProvider.notifier).loadNextPage();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        ref.read(charactersRickMortyProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    final characters = ref.watch(charactersRickMortyProvider);

    const gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10);

    return GridView.builder(
      controller: scrollController,
      itemCount: characters.length,
      gridDelegate: gridDelegate,
      itemBuilder: (BuildContext context, int index) {
        final character = characters[index];
        return InkWell(
          onTap: () {
            context.push('/home/0/character/${character.id}');
          },
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _CharacterImage(character: character),
                Text(
                  character.name,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                _CharacterStatus(character: character),
              ]),
        );
      },
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
        width: 150,
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
    required this.character,
  });

  final CharacterEntity character;

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
              color: ChangeStatus.color(character.status),
              size: 15,
            ),
          ),
          Text(character.status)
        ]);
  }
}
