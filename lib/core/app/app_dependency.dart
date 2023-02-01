import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_dependency.config.dart';

final instance = GetIt.instance;

@injectableInit
void configureInjection() => $initGetIt(instance);

@module
abstract class AppModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
