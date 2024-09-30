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
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const HeaderWidget(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.040,
                ),
                CustomDaysList(
                  weatherEntity: model!,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
                TempWidget(
                  weatherEntity: model,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                ),
                TempStatusList(
                  weatherEntity: model,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
