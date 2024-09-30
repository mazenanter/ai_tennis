import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTempTextWidget extends StatelessWidget {
  const CustomTempTextWidget({
    super.key,
    required this.temp,
  });
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            temp,
            style: AppStyles.bold28.copyWith(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                )),
          ),
        ],
      ),
    );
  }
}
