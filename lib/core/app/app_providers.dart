import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receptyUser/features/screens/auth/cubit/auth_cubit.dart';
import 'package:receptyUser/features/screens/blogs/cubit/blogs_cubit.dart';
import 'package:receptyUser/features/screens/category/cubit/category_cubit.dart';
import 'package:receptyUser/features/screens/home/cubit/home_cubit.dart';
import 'package:receptyUser/features/screens/recipe/cubit/recipe_cubit.dart';

import '../../features/screens/no_internet/cubit/internet_cubit.dart';
import '../../features/screens/theme/cubit/theme_cubit.dart';
import 'app_dependency.dart';

class AppProviders {
  static final providers = <BlocProvider>[
    BlocProvider<ThemeCubit>(
        create: (BuildContext context) => instance<ThemeCubit>()),
    BlocProvider<InternetCubit>(
        create: (BuildContext context) => instance<InternetCubit>()),
    BlocProvider<AuthCubit>(
        create: (BuildContext context) => instance<AuthCubit>()),
    BlocProvider<HomeCubit>(
        create: (BuildContext context) => instance<HomeCubit>()),
    BlocProvider<RecipeCubit>(
        create: (BuildContext context) => instance<RecipeCubit>()),
    BlocProvider<CategoryCubit>(
        create: (BuildContext context) => instance<CategoryCubit>()),
    BlocProvider<BlogsCubit>(
        create: (BuildContext context) => instance<BlogsCubit>()),
  ];
}
