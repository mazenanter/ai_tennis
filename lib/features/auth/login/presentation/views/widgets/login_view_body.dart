import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/services/di.dart';
import 'package:ai_tennis/core/widgets/cusom_text_form_field.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/core/widgets/custom_indicato.dart';
import 'package:ai_tennis/core/widgets/custom_text_button.dart';
import 'package:ai_tennis/features/auth/login/data/repos/repo.dart';
import 'package:ai_tennis/features/auth/login/presentation/manager/login_user_cubit/login_user_cubit_cubit.dart';
import 'package:ai_tennis/features/auth/login/presentation/views/widgets/snack_bar.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubitCubit(getit.get<LoginUserRepo>()),
      child: BlocConsumer<LoginUserCubitCubit, LoginUserCubitState>(
        listener: (context, state) {
          if (state is LoginUserCubitSuccess) {
            successSnackbar(context, "login successfully");
            context.go(AppRoutes.kLocationView);
          } else if (state is LoginUserCubitError) {
            errorSnackBar(context, state.errMsg);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: formKey,
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
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'must not be empty';
                      }
                      if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'must not be empty';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null; //
                    },
                    secureText: true,
                    controller: passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ConditionalBuilder(
                    condition: state is LoginUserCubitLoading,
                    builder: (context) => const CustomIndicator(),
                    fallback: (context) => CustomButton(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<LoginUserCubitCubit>(context)
                              .loginUser(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      buttonText: 'LOGIN',
                    ),
                  ),
                  CustomTextButton(
                    onPress: () {
                      GoRouter.of(context).push(AppRoutes.kRegisterView);
                    },
                    text: 'DON\'T HAVE AN ACCOUT?',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
