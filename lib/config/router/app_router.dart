import 'package:go_router/go_router.dart';

import '../../screens/screens.dart';

// GoRouter configuration
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/ProgresScreen',
      builder: (context, state) => const Progressscreen(),
    ),
    GoRoute(
      path: '/CardScreen',
      builder: (context, state) => CardScreen(),
    ),
    GoRoute(
      path: '/QuizScreen',
      builder: (context, state) => const QuizScreen(),
    ),
  ],
);
