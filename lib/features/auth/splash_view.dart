import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _rotationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
    navigateToLoginView();
  }

  void initAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _fadeController.forward();
    });

    _rotationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: Curves.linear,
      ),
    );

    _rotationController.repeat();
  }

  void navigateToLoginView() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          context.go(AppRoutes.kLoginOrSignUpView);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Text(
                  'Tennis AI',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              RotationTransition(
                turns: _rotationAnimation,
                child: Image.asset(
                  height: 80,
                  width: 80,
                  'assets/images/ben-hershey-VEW78A1YZ6I-unsplash 1.png',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}
