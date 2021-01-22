import 'dart:convert';
import 'package:foodaholic_app_v/models/menu_model.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class MenusService {
  String _urlRoot = "https://proyecto-delivery-typesc-9f79b.web.app/api";

  MenusService();

  Future<Menus> _requestList(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final menus = new Menus.fromJsonList(decodedData);
      return menus;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Menu> _request(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final menu = new Menu.fromJsonMap(decodedData);
      return menu;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Menus> getMenus(int page, int limit) async {
    String path = "$_urlRoot/page/foods/$page/$limit";
    return await _requestList(path);
  }

  Future<Menu> getMenu(String id) async {
    String path = "$_urlRoot/foods/$id";
    return await _request(path);
  }
}