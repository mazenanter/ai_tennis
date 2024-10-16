import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/widgets/custom_button.dart';
import 'package:ai_tennis/core/widgets/custom_indicato.dart';
import 'package:ai_tennis/core/widgets/snack_bar.dart';
import 'package:ai_tennis/features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.cityName,
    required this.hour,
  });
  final String cityName;
  final int hour;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetWeatherCubit, GetWeatherState>(
      listener: (context, state) {
        if (state is GetWeatherSuccess) {
          var model = state.weatherEntity;
          BlocProvider.of<GetWeatherCubit>(context)
              .getPrediction(features: model.getListAiFeature());
          GoRouter.of(context).push(AppRoutes.kHomeView);
        } else if (state is GetWeatherError) {
          errorSnackBar(
            context,
            state.errMsg,
          );
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is GetWeatherLoading,
          builder: (context) => const CustomIndicator(),
          fallback: (context) => CustomButton(
            onPress: () {
              BlocProvider.of<GetWeatherCubit>(context).getWeather(
                cityName: cityName,
                hour: hour,
              );
            },
            buttonText: 'Search',
          ),
        );
      },
    );
  }
}
