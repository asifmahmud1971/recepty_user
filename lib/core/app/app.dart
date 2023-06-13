import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_translator/google_translator.dart';
import 'package:phone_form_field/l10n/generated/phone_field_localization.dart';
import 'package:receptyUser/core/app/app_providers.dart';
import 'package:receptyUser/features/components/my_context.dart';
import 'package:receptyUser/features/screens/no_internet/cubit/internet_cubit.dart';

import '../../features/router/routes.dart';
import '../../features/screens/theme/app_theme.dart';
import '../../features/screens/theme/cubit/theme_cubit.dart';

class InitApp extends StatelessWidget {
  const InitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppProviders.providers, child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return BlocConsumer<InternetCubit, InternetState>(
          listener: (context, internetState) {
            log(internetState.status.toString());
          },
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(428, 926), // figma app screen size
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (BuildContext context, Widget? child) {
                return MaterialApp(
                  navigatorKey: GetContext.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  builder: EasyLoading.init(),
                  title: 'Recipty',
                  theme: context.read<ThemeCubit>().darkTheme
                      ? AppTheme.darkTheme
                      : AppTheme.lightTheme,
                  onGenerateRoute: RouteGenerator.getRoute,
                  initialRoute: Routes.splash,
                  localizationsDelegates: [
                    ...context.localizationDelegates,
                    PhoneFieldLocalization.delegate
                  ],
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                );
              },
            );
          },
        );
      },
    );
  }
}
