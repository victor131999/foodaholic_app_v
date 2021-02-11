import 'package:flutter/material.dart';

List<String> typesReport = ['Sugerencia', 'Denuncia'];

String urlRoot = "https://proyecto-delivery-typesc-9f79b.web.app/api";

String uploadUrl =
    "https://api.cloudinary.com/v1_1/dutwlsrv9/image/upload?upload_preset=a8oja3i4";

class MenuItem {
  String key;
  String title;
  IconData icon;
  MenuItem(this.key, this.title, this.icon);
}

final List<MenuItem> mainActions = [
  MenuItem("config", "Configuración", Icons.settings),
  MenuItem("about", "Acerca de", Icons.info),
];