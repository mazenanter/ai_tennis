import 'package:ai_tennis/core/utils/app_styles.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/custom_days_list.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/header_widget.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/temp_status_list.dart';
import 'package:ai_tennis/features/home/presentation/views/widgets/temp_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetWeatherCubit, GetWeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = BlocProvider.of<GetWeatherCubit>(context).weatherEntity;
        var height = MediaQuery.sizeOf(context).height;
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const HeaderWidget(),
                SizedBox(
                  height: height * 0.040,
                ),
                CustomDaysList(
                  weatherEntity: model!,
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                if (state is GetWeatherSuccess)
                  Text(
                    state.weatherEntity.cityName,
                    style: AppStyles.bold28.copyWith(
                      color: Colors.white,
                    ),
                  ),
                SizedBox(
                  height: height * 0.03,
                ),
                TempWidget(
                  weatherEntity: model,
                ),
                SizedBox(
                  height: height * 0.06,
                ),
                TempStatusList(
                  weatherEntity: model,
                ),
                SizedBox(
                  height: height * 0.040,
                ),
                CustomButton(
                  onPress: () {
                    Navigator.pop(context);
                  },
                  buttonText: 'Back',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
