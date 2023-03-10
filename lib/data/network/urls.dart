import '../../core/app/app_flavor.dart';

class Urls {
  static bool isTest = AppFlavor.getFlavor;
  static String baseUrl = isTest ? testUrl : liveUrl;
  static const String liveUrl =
      'https://jahodiss-recepty.com/api/'; //live server
  static const String testUrl =
      'https://jahodiss-recepty.com/api/'; // test server

  static const String login = 'auth/user/login';
  static const String registration = 'auth/register';
  static const String user = 'user';
  static const String home = 'user/home';
  static const String categories = 'user/categories';
  static const String ingredients = 'ingredients';
  static const String tutorials = 'user/tutorials';
  static  String tutorialsByCategory(catID){
    return 'user/categories/$catID/tutorials';
  }
  static const String blogs = 'user/blogs';
}
