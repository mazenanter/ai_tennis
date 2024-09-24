import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/widgets/cusom_text_form_field.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'LOGIN',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const Text(
            'log in to your account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomTextFormField(
            controller: emailController,
            hintText: 'Email',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            controller: passwordController,
            hintText: 'Password',
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
            onPress: () {},
            buttonText: 'LOGIN',
          ),
          CustomTextButton(
            onPress: () {
              GoRouter.of(context).push(AppRoutes.kRegisterView);
            },
            text: 'DON\'T HAVE AN ACCOUT?',
          ),
        ],
      ),
    );
  }
}
