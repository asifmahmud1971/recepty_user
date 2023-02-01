import '../../core/app/app_flavor.dart';

class Urls {
  static bool isTest = AppFlavor.getFlavor;
  static String baseUrl = isTest ? testUrl : liveUrl;
  static const String liveUrl = 'https://hmbadhon.me/api/v1/'; //live server
  static const String testUrl =
      'https://test.hmbadhon.me/api/v1/'; // test server
}
