import 'package:ai_tennis/features/auth/login_or_signup/widgets/my_custom_clipper.dart';
import 'package:flutter/material.dart';

class CustomShapeContainer extends StatelessWidget {
  const CustomShapeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: MediaQuery.sizeOf(context).height / 1.7,
        width: double.infinity,
        color: Colors.white,
      ),
    );
  }
}
