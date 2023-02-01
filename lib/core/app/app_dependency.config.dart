// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../features/screens/no_internet/cubit/internet_cubit.dart' as _i4;
import '../../features/screens/theme/cubit/theme_cubit.dart' as _i6;
import 'app_dependency.dart' as _i7;
import 'app_preference.dart' as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.AppPreferences>(() => _i3.AppPreferences());
  gh.factory<_i4.InternetCubit>(() => _i4.InternetCubit());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i6.ThemeCubit>(() => _i6.ThemeCubit());
  return get;
}

class _$AppModule extends _i7.AppModule {}
