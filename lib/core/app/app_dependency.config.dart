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
import '../../data/repository/item_repo.dart' as _i18;
import '../../data/repository/item_repo_imp.dart' as _i17;
import '../../features/screens/auth/cubit/auth_cubit.dart' as _i21;
import '../../features/screens/auth/repository/auth_repo.dart' as _i10;
import '../../features/screens/auth/repository/auth_repo_imp.dart' as _i9;
import '../../features/screens/blogs/cubit/blogs_cubit.dart' as _i22;
import '../../features/screens/blogs/repository/blogs_repo.dart' as _i12;
import '../../features/screens/blogs/repository/blogs_repo_imp.dart' as _i11;
import '../../features/screens/category/cubit/category_cubit.dart' as _i23;
import '../../features/screens/category/repository/category_repo.dart' as _i14;
import '../../features/screens/category/repository/category_repo_imp.dart'
    as _i13;
import '../../features/screens/home/cubit/home_cubit.dart' as _i24;
import '../../features/screens/home/repository/home_repo.dart' as _i16;
import '../../features/screens/home/repository/home_repo_imp.dart' as _i15;
import '../../features/screens/no_internet/cubit/internet_cubit.dart' as _i5;
import '../../features/screens/recipe/cubit/recipe_cubit.dart' as _i25;
import '../../features/screens/recipe/repository/recipe_repo.dart' as _i20;
import '../../features/screens/recipe/repository/recipe_repo_imp.dart' as _i19;
import '../../features/screens/theme/cubit/theme_cubit.dart' as _i7;
import 'app_dependency.dart' as _i26;
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
  gh.factory<_i11.BlogsRepositoryImp>(
      () => _i12.BlogsRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i13.CategoryRepositoryImp>(
      () => _i14.CategoryRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i15.HomeRepositoryImp>(
      () => _i16.HomeRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i17.ItemRepositoryImp>(
      () => _i18.ItemRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i19.RecipeRepositoryImp>(
      () => _i20.RecipeRepository(apiClient: get<_i8.ApiClient>()));
  gh.factory<_i21.AuthCubit>(
      () => _i21.AuthCubit(get<_i9.AuthRepositoryImp>()));
  gh.factory<_i22.BlogsCubit>(
      () => _i22.BlogsCubit(get<_i11.BlogsRepositoryImp>()));
  gh.factory<_i23.CategoryCubit>(
      () => _i23.CategoryCubit(get<_i13.CategoryRepositoryImp>()));
  gh.factory<_i24.HomeCubit>(
      () => _i24.HomeCubit(get<_i15.HomeRepositoryImp>()));
  gh.factory<_i25.RecipeCubit>(
      () => _i25.RecipeCubit(get<_i19.RecipeRepositoryImp>()));
  return get;
}

class _$AppModule extends _i26.AppModule {}
