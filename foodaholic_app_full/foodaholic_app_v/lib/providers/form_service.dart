import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:foodaholic_app_v/models/message_model.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:foodaholic_app_v/utils/utils.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class MenusService {
  String _urlRoot = urlRoot;
  Map<String, String> _headers = {"Content-Type": "application/json"};

  MenusService();

  Future<Message> post(Reservation reservation) async {
    String url = "$_urlRoot/reservations";
    final resp =
        await http.post(url, headers: _headers, body: reportToJson(reservation));
    if (resp.body.isEmpty) return null;
    final decodedData = json.decode(resp.body);
    final message = new Message.fromJson(decodedData);
    return message;
  }

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(uploadUrl);
    final mimeType = mime(image.path).split("/");

    final imageUploadRequest = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath("file", image.path,
        contentType: MediaType(mimeType[0], mimeType[1]));

    imageUploadRequest.files.add(file);

    final imageResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(imageResponse);
    if (resp.statusCode != 200) {
      print('Error: ' + resp.body);
      return null;
    }
    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];
  }
}