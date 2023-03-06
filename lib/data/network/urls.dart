import '../../core/app/app_flavor.dart';

class Urls {
  static bool isTest = AppFlavor.getFlavor;
  static String baseUrl = isTest ? testUrl : liveUrl;
  static const String liveUrl =
      'https://jahodiss-recepty.com/api/'; //live server
  static const String testUrl =
      'https://jahodiss-recepty.com/api/'; // test server

  static const String login = 'auth/login';
  static const String registration = 'auth/register';
  static const String user = 'user';
  static const String categories = 'categories';
  static const String ingredients = 'ingredients';
  static const String tutorials = 'tutorials';
  static const String blogs = 'blogs';
}
