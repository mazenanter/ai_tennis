import 'package:ai_tennis/core/services/api_service.dart';
import 'package:ai_tennis/features/auth/login/data/repos/repo.dart';
import 'package:ai_tennis/features/auth/login/data/repos/repo_impl.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo_impl.dart';
import 'package:ai_tennis/features/home/data/data_source/remote_data_source.dart';
import 'package:ai_tennis/features/home/data/repo/home_repo_impl.dart';
import 'package:ai_tennis/features/home/domain/repo/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<LoginUserRepo>(LoginUserRepoImpl());
  getit.registerSingleton<RegisterRepo>(RegisterRepoImpl());
  getit.registerSingleton<HomeRepo>(
      HomeRepoImpl(RemoteDataSourceImpl(ApiService(Dio()))));
}
