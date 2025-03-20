import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pal_book/models/pal_model.dart';

class HomeViewModel {
  Future<List<PalModel>> fetchPals() async {
    final jsonString = await rootBundle.loadString("assets/json/pal.json");
    final List<Map<String, dynamic>> jsonList = jsonDecode(jsonString);

    return jsonList.map((json) => PalModel.fromJson(json)).toList();
  }
}
