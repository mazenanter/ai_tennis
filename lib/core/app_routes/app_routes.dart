import 'package:ai_tennis/features/auth/presentation/views/login_view.dart';
import 'package:ai_tennis/features/auth/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, GoRouterState state) {
          return const LoginView();
        },
      ),
    ],
  );
}
