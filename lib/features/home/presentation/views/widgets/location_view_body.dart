import 'package:ai_tennis/features/home/presentation/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class LocationViewBody extends StatelessWidget {
  const LocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            HeaderWidget(),
          ],
        ),
      ),
    );
  }
}
