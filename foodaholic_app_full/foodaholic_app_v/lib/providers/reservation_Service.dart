import 'dart:convert';
import 'package:foodaholic_app_v/models/reservation_model.dart';

import 'package:http/http.dart' as http;
import 'dart:async';

class ReservationsService {
  String _urlRoot = "https://proyecto-delivery-typesc-9f79b.web.app/api";

  ReservationsService();

  Future<Reservations> _requestList(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final reservations = new Reservations.fromJsonList(decodedData);
      return reservations;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Reservation> _request(String url) async {
    try {
      final resp = await http.get(url);
      if (resp.body.isEmpty) return null;
      final decodedData = json.decode(resp.body);
      final reservation = new Reservation.fromJsonMap(decodedData);
      return reservation;
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<Reservations> getReservations(int page, int limit) async {
    String path = "$_urlRoot/page/foods/$page/$limit";
    return await _requestList(path);
  }

  Future<Reservation> getReservation(String id) async {
    String path = "$_urlRoot/foods/$id";
    return await _request(path);
  }
}