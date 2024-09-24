import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/widgets/cusom_text_form_field.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/core/widgets/custom_text_button.dart';
import 'package:ai_tennis/features/auth/login/presentation/views/widgets/snack_bar.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo_impl.dart';
import 'package:ai_tennis/features/auth/register/presentation/manager/user_register_cubit/user_register_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  var emialController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterCubit(RegisterRepoImpl()),
      child: BlocConsumer<UserRegisterCubit, UserRegisterState>(
        listener: (context, state) {
          if (state is UserRegisterSuccess) {
            successSnackbar(context, "Email created successfully");
            GoRouter.of(context).push(AppRoutes.kLoginView);
          } else if (state is UserRegisterErr) {
            errorSnackBar(context, state.errMsg);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.22,
                  ),
                  const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'create your account',
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
                      if (value == null || value.isEmpty) {
                        return 'must not be empty';
                      }
                      return null;
                    },
                    controller: nameController,
                    hintText: 'Full Name',
                  ),
                  const SizedBox(
                    height: 10,
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
                    controller: emialController,
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
                    controller: passwordController,
                    secureText: true,
                    hintText: 'Password',
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ConditionalBuilder(
                    condition: state is UserRegisterLoading,
                    builder: (context) => const Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      color: AppColors.buttonColor,
                    )),
                    fallback: (context) => CustomButton(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<UserRegisterCubit>(context)
                              .registerUser(
                            name: nameController.text,
                            email: emialController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      buttonText: 'Create',
                    ),
                  ),
                  CustomTextButton(
                    onPress: () {
                      GoRouter.of(context).push(AppRoutes.kLoginView);
                    },
                    text: 'HAVE AN ACCOUT?',
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
