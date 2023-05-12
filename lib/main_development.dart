import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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

  Stripe.publishableKey =
      "pk_live_51MpsChJwb0N1zIWuMOlSvJ47G8IGYmOknEhR0aqECR5JqJYaRievWl4BYfaAvDh98u6aoR8JJ4SqoXg5RwRCzdNs0045cqGrKY";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.development;
  EasyLoading.instance..userInteractions = false;
  //Init my app with observer
  await blocObserver(
    () => EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('sk', 'SK'),
        Locale('fr', 'CH'),
        Locale('cs', 'CZ'),
      ],
      fallbackLocale: const Locale('cs', 'CZ'),
          startLocale: const Locale('cs', 'CZ'),
          saveLocale: true,
          path: 'assets/translations',
          child: const InitApp(),
        ),
  );
}
