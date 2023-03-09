// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../data/network/api_client.dart' as _i8;
import '../../data/repository/item_repo.dart' as _i14;
import '../../data/repository/item_repo_imp.dart' as _i13;
import '../../features/screens/auth/cubit/auth_cubit.dart' as _i17;
import '../../features/screens/auth/repository/auth_repo.dart' as _i10;
import '../../features/screens/auth/repository/auth_repo_imp.dart' as _i9;
import '../../features/screens/home/cubit/home_cubit.dart' as _i18;
import '../../features/screens/home/repository/home_repo.dart' as _i12;
import '../../features/screens/home/repository/home_repo_imp.dart' as _i11;
import '../../features/screens/no_internet/cubit/internet_cubit.dart' as _i5;
import '../../features/screens/recipe/cubit/recipe_cubit.dart' as _i19;
import '../../features/screens/recipe/repository/recipe_repo.dart' as _i16;
import '../../features/screens/recipe/repository/recipe_repo_imp.dart' as _i15;
import '../../features/screens/theme/cubit/theme_cubit.dart' as _i7;
import 'app_dependency.dart' as _i20;
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
  gh.factory<_i4.Dio>(() => appModule.dio);
  gh.factory<_i5.InternetCubit>(() => _i5.InternetCubit());
  await gh.factoryAsync<_i6.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i7.ThemeCubit>(() => _i7.ThemeCubit());
  gh.factory<_i8.ApiClient>(() => _i8.ApiClient(get<_i4.Dio>()));
  gh.factory<_i9.AuthRepositoryImp>(
      () => _i10.AuthRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i11.HomeRepositoryImp>(
      () => _i12.HomeRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i13.ItemRepositoryImp>(
      () => _i14.ItemRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i15.RecipeRepositoryImp>(
      () => _i16.RecipeRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i17.AuthCubit>(
      () => _i17.AuthCubit(get<_i9.AuthRepositoryImp>()));
  gh.factory<_i18.HomeCubit>(
      () => _i18.HomeCubit(get<_i11.HomeRepositoryImp>()));
  gh.factory<_i19.RecipeCubit>(
      () => _i19.RecipeCubit(get<_i15.RecipeRepositoryImp>()));
  return get;
}

class _$AppModule extends _i20.AppModule {}
