import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<AlignmentGeometry> _alignAnimation;
  late Animation<double> _rotationAnimation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToLoginView();
  }

  void initAnimation() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
    _rotationAnimation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  void navigateToLoginView() {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        if (mounted) {
          context.go(AppRoutes.kLoginView);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                fit: BoxFit.fill,
                height: MediaQuery.sizeOf(context).height,
                'https://us.123rf.com/450wm/christovstudio/christovstudio2102/christovstudio210201270/164418471-tennis-men-smash-line-pop-art-potrait-logo-colorful-design-with-dark-background-abstract-vector.jpg',
              ),
              AlignTransition(
                alignment: _alignAnimation,
                child: RotationTransition(
                  turns: _rotationAnimation,
                  child: Image.asset(
                    height: 80,
                    width: 80,
                    'assets/images/ben-hershey-VEW78A1YZ6I-unsplash 1.png',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
