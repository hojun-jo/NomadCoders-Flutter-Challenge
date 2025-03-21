import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pal_book/models/pal_model.dart';

class HomeViewModel {
  Future<List<PalModel>> fetchPals() async {
    final jsonString = await rootBundle.loadString("assets/json/pal.json");
    final Map<String, dynamic> json = jsonDecode(jsonString);
    final List<PalModel> pals =
        (json["data"] as List).map((json) => PalModel.fromJson(json)).toList();

    return pals;
  }

  String getBackgroundImagePath(String palId) {
    return "assets/images/pal_bg/pal_bg_$palId.jpeg";
  }

  String getPalImagePath(String palId) {
    return "assets/images/pal/pal_$palId.png";
  }
}
