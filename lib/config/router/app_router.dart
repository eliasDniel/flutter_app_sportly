import 'package:flutter_app_sportly/presentation/screens/home_screens.dart';


import 'package:go_router/go_router.dart';



final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreen(pageIndex: pageIndex);
      },
     ),
  GoRoute(
    path: '/',
    redirect: (_,__) => '/home/0',
  ),
]);