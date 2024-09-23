import 'package:ai_tennis/features/auth/login/presentation/views/login_view.dart';
import 'package:ai_tennis/features/auth/login_or_signup/views/login_or_signup_view.dart';
import 'package:ai_tennis/features/auth/register/presentation/views/register_view.dart';
import 'package:ai_tennis/features/auth/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const kLoginView = '/loginView';
  static const kLoginOrSignUpView = '/loginOrSignUpView';
  static const kRegisterView = '/registerView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kLoginOrSignUpView,
        builder: (context, GoRouterState state) {
          return const LoginOrSignupView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, GoRouterState state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, GoRouterState state) {
          return const RegisterView();
        },
      ),
    ],
  );
}
