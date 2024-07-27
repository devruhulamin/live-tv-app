import 'package:go_router/go_router.dart';
import 'package:mojo_live_tv/presentation/screens/home_page/home_screen.dart';

final router = GoRouter(
  initialLocation: "/",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    )
  ],
);
