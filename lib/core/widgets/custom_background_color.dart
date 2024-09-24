import 'package:flutter/material.dart';

class CustomBackgroundColor extends StatelessWidget {
  const CustomBackgroundColor({
    super.key,
  });
  // final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff01193F),
            Color(0xff011538),
            Color(0xff000D2D),
            Color(0xff000D2D),
            Color(0xff000B29),
            Color(0xff00011D),
            Color(0xff00011D),
          ],
        ),
      ),
    );
  }
}
