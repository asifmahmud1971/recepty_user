import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetContext {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext context = navigatorKey.currentContext!;
  static Object? argument = ModalRoute.of(context)!.settings.arguments;

  final ValueNotifier<bool> IS_PORTRAIT = ValueNotifier<bool>(true);

  static Size size() => context.size!;

  static Future to(Widget page, {dynamic arguments}) {
    return Navigator.of(context, rootNavigator: false).push(
      CupertinoPageRoute<dynamic>(
        fullscreenDialog: false,
        builder: (BuildContext context) => page,
        settings: RouteSettings(
          arguments: arguments,
        ),
      ),
    );
  }

  static Future toNamed({String? route, dynamic arguments}) {
    return Navigator.of(context).pushNamed(route!, arguments: arguments);
  }

  static void back([dynamic result]) {
    return Navigator.of(context).pop(result);
  }

  static void backOff([dynamic result]) {
    return Navigator.of(context).popUntil(result);
  }

  static Future offAll(String route) {
    return Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static Future toReplace(Widget page) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => page));
  }
}
