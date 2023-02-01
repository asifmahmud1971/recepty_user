import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../network/api_client.dart';
import 'item_repo_imp.dart';

@Injectable(as: ItemRepositoryImp)
class ItemRepository implements ItemRepositoryImp {
  final ApiClient apiClient;

  ItemRepository({required this.apiClient});

  @override
  Future<Response> fetchSlider() async {
    var url = '/sliders';

    return await apiClient.request(url: url, method: Method.get);
  }
}
