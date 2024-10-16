import 'package:ai_tennis/core/utils/app_colors.dart';
import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:ai_tennis/features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:flutter/material.dart';

Future<dynamic> customDiolog(
    BuildContext context, GetPredictionSuccess state, String message) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: state.predicitions[0] == 0 ? Colors.red : Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                state.predicitions[0] == 0 ? Icons.info_outline : Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
          ),
        ),
        actions: [
          Center(
              child: Text(
            message,
            style: AppStyles.bold16,
          )),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: AppStyles.bold19.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
