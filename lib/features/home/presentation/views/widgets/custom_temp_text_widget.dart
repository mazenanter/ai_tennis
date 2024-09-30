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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        children: [
          Text(
            'Temp',
            style: AppStyles.bold23.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temp,
                style: AppStyles.bold28.copyWith(
                  color: Colors.white,
                  fontSize: 55,
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
        ],
      ),
    );
  }
}
