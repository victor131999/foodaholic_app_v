import 'dart:convert';
import 'package:foodaholic_app_v/models/combo_model.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class CombosService {
  String _urlRoot = "https://proyecto-delivery-typesc-9f79b.web.app/api";

  CombosService();

  Future<Combos> _requestList(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final combos = new Combos.fromJsonList(decodedData);
      return combos;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Combo> _request(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final combo = new Combo.fromJsonMap(decodedData);
      return combo;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Combos> getCombos(int page, int limit) async {
    String path = "$_urlRoot/page/combos/$page/$limit";
    return await _requestList(path);
  }

  Future<Combo> getCombo(String id) async {
    String path = "$_urlRoot/combos/$id";
    return await _request(path);
  }
}