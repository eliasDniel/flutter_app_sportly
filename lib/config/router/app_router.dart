import 'package:go_router/go_router.dart';
import '../../presentation/screens/home_screen.dart';
import '../../presentation/screens/initial_screen.dart';

final appRouter = GoRouter(initialLocation: '/initial', routes: [
  GoRoute(
      path: '/initial',
      name: InitialScreen.name,
      builder: (context, state) => const InitialScreen(),
      routes: [
        GoRoute(
          path: 'home/:code/:page',
          name: HomeScreen.name,
          builder: (context, state) {
            final pageIndex = int.parse(state.params['page'] ?? '0');
            final code = state.params['code'] ?? '';
            return HomeScreen(pageIndex: pageIndex, code: code);
          },
        ),
      ]),
  GoRoute(
    path: '/',
    redirect: (_, __) => '/initial',
  ),
]);
