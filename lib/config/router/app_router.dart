
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DomusScreen(),
      ),
      GoRoute(
      path: '/numerator-river',
      builder: (context, state) => const NumeratorScreen(),
      ),
       GoRoute(
      path: '/videos',
      builder: (context, state) => const VideosScreen(),
      ),
  ]
  );