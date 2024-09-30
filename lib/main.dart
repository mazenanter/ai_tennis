import 'package:ai_tennis/core/app_routes/app_routes.dart';
import 'package:ai_tennis/core/services/api_service.dart';
import 'package:ai_tennis/core/services/custom_bloc_observer.dart';
import 'package:ai_tennis/core/services/di.dart';
import 'package:ai_tennis/features/home/data/data_source/remote_data_source.dart';
import 'package:ai_tennis/features/home/data/repo/home_repo_impl.dart';
import 'package:ai_tennis/features/home/presentation/manager/get_weather_cubit/get_weather_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = CustomBlocObserver();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(
          HomeRepoImpl(RemoteDataSourceImpl(ApiService(Dio())))),
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        title: 'Ai tennis',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
