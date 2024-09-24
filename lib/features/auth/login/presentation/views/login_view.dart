import 'package:ai_tennis/core/widgets/custom_background_color.dart';
import 'package:ai_tennis/features/auth/login/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomBackgroundColor(),
          LoginViewBody(),
        ],
      ),
    );
  }
}
