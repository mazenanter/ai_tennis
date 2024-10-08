import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/features/auth/login_or_signup/widgets/custom_shape_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginOrSignupView extends StatelessWidget {
  const LoginOrSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000D2C),
      body: Column(
        children: [
          const CustomShapeContainer(),
          const Spacer(),
          CustomButton(
            onPress: () {
              GoRouter.of(context).push(AppRoutes.kLoginView);
            },
            buttonText: 'Sign In',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            onPress: () {
              GoRouter.of(context).push(AppRoutes.kRegisterView);
            },
            buttonColor: Colors.white,
            buttonText: 'Sign Up',
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
