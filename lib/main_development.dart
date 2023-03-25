import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  "pk_test_51MpFqYFkJt7AnaBKjmN1TJXc5j0ZHLJ72Nh0q1dIbfXIj8JR43gYn1eSlfwGDpzbKmCFaDxxNVvr2qxfgacILZg200CzMEgQ88";

  //Load our .env file that contains our Stripe Secret key
  await dotenv.load(fileName: "assets/.env");
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.development;
  //Init my app with observer
  await blocObserver(
        () =>
        EasyLocalization(
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('de', 'DE'),
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
