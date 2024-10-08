import 'package:ai_tennis/core/widgets/custom_background_color.dart';
import 'package:ai_tennis/features/auth/register/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomBackgroundColor(),
          RegisterViewBody(),
        ],
      ),
    );
  }
}
