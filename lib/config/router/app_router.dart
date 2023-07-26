import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/presentation/screens/rick_morty/character_screen.dart';
import 'package:rick_morty_app/presentation/screens/rick_morty/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      builder: (context, state) {
        final String pageIndex = state.pathParameters['page'] ?? '0';
        return HomeScreen(pageIndex: int.parse(pageIndex));
      },
      routes: [
        GoRoute(
          path: 'character/:characterId',
          builder: (_, state) {
            final String characterId =
                state.pathParameters['characterId'] ?? '';
            return CharacterScreen(characterId: characterId);
          },
        )
      ]),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/home/0',
  )
]);
