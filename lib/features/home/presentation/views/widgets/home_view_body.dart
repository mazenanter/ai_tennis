import 'package:ai_tennis/features/home/presentation/views/widgets/custom_days_list.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const HeaderWidget(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.040,
            ),
            const CustomDaysList(),
          ],
        ),
      ),
    );
  }
}
