import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:foodaholic_app_v/utils/preferences.dart';

class UserProvider {
  final String _firebaseToken = 'AIzaSyCjU21EeHVMjQRxAFkTd4n56Pj6KKcEsCM';
  final _prefs = new Preferences();

  Future<Map<String, dynamic>> login(String email, String password) async {
    final authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final resp = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=$_firebaseToken',
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      _prefs.token = decodedResp['idToken'];
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'message': decodedResp['error']['message']};
    }
  }
}
