import 'dart:convert';
import 'package:foodaholic_app_v/models/drink_model.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class DrinksService {
  String _urlRoot = "https://proyecto-delivery-typesc-9f79b.web.app/api";

  DrinksService();

  Future<Drinks> _requestList(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final drinks = new Drinks.fromJsonList(decodedData);
      return drinks;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Drink> _request(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final drink = new Drink.fromJsonMap(decodedData);
      return drink;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Drinks> getDrinks(int page, int limit) async {
    String path = "$_urlRoot/page/drinks/$page/$limit";
    return await _requestList(path);
  }

  Future<Drink> getDrink(String id) async {
    String path = "$_urlRoot/drinks/$id";
    return await _request(path);
  }
}