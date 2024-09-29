import 'package:ai_tennis/features/auth/login/data/repos/repo.dart';
import 'package:ai_tennis/features/auth/login/data/repos/repo_impl.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo.dart';
import 'package:ai_tennis/features/auth/register/data/repos/repo_impl.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setup() {
  getit.registerSingleton<LoginUserRepo>(LoginUserRepoImpl());
  getit.registerSingleton<RegisterRepo>(RegisterRepoImpl());
}
