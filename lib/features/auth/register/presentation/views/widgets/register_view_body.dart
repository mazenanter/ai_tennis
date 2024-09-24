import 'package:ai_tennis/core/app_routes/app_routes.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRegisterCubit(RegisterRepoImpl()),
      child: BlocConsumer<UserRegisterCubit, UserRegisterState>(
        listener: (context, state) {
          if (state is UserRegisterSuccess) {
            successSnackbar(context, "Email created successfully");
          } else if (state is UserRegisterErr) {
            errorSnackBar(context, state.errMsg);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                controller: nameController,
                hintText: 'Full Name',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: emialController,
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
              ConditionalBuilder(
                condition: state is UserRegisterLoading,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
                fallback: (context) => CustomButton(
                  onPress: () {
                    BlocProvider.of<UserRegisterCubit>(context).registerUser(
                      name: nameController.text,
                      email: emialController.text,
                      password: passwordController.text,
                    );
                  },
                  buttonText: 'Create',
                ),
              ),
              CustomTextButton(
                onPress: () {
                  GoRouter.of(context).push(AppRoutes.kRegisterView);
                },
                text: 'HAVE AN ACCOUT?',
              ),
            ],
          );
        },
      ),
    );
  }
}
