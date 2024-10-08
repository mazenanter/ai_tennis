import 'package:ai_tennis/core/widgets/custom_background_color.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          CustomBackgroundColor(),
          HomeViewBody(),
        ],
      ),
    );
  }
}
