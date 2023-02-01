import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app/app.dart';
import 'core/app/app_dependency.dart';
import 'core/app/app_flavor.dart';
import 'core/app_bloc_observer.dart';

void main() async {
  //Init Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Init easy localization
  await EasyLocalization.ensureInitialized();
  //Init modules
  configureInjection();
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.staging;
  //Init my app with observer
  await blocObserver(
    () => EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
        Locale('fr', 'CH'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      startLocale: const Locale('en', 'US'),
      saveLocale: true,
      path: 'assets/translations',
      child: const InitApp(),
    ),
  );
}
