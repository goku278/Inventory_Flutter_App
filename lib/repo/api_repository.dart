import 'package:flutter/cupertino.dart';

import '../model/items.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Items>> fetchItemsList(int id) {
    debugPrint("Inside api_repository fetchItemsList");
    return _apiProvider.fetchAllItems();
  }
}
