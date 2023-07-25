import 'package:go_router/go_router.dart';
import 'package:rick_morty_app/presentation/screens/rick_morty/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  )
]);
