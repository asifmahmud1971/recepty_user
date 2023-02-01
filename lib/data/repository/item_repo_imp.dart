import 'package:http/http.dart';

abstract class ItemRepositoryImp {
  Future<Response> fetchSlider();
}
