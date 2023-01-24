import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/content_model.dart';

class ContentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Content.fromJson(map);
      if (map is List)
        return map.map((item) => Content.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Content?> getContent(int id) async {
    final response = await get('content/$id');
    return response.body;
  }

  Future<Response<Content>> postContent(Content content) async =>
      await post('content', content);
  Future<Response> deleteContent(int id) async => await delete('content/$id');

  Future<Content> readJson(String fileLocation) async {
    final String response = await rootBundle.loadString(fileLocation);
    final data = await json.decode(response);
    return Content.fromJson(data);
  }
}
