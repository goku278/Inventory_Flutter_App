import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/item_response.dart';
import '../model/items.dart';

class ApiProvider {
  // Please replace this ip address with your system's ip address...
  final String _url = "http://192.168.1.21:8082/api/inventory/fetchAllItems/";

  Future<List<Items>> fetchAllItems() async {
    try {
      // Dio dio = Dio();
      Dio dio = Dio(BaseOptions(
        connectTimeout: const Duration(seconds: 30), // 10 seconds
        receiveTimeout: const Duration(seconds: 30), // 10 seconds
      ));
      Response response = await dio.get(_url);
      ItemResponse value = ItemResponse.fromJson(response.data);
      print("value => ${value.data?[0].description}");
      return value.data!;
    } catch (e) {
      debugPrint('Error -> ${e.toString()}');
      return [];
    }
  }
}
