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

class FCMNotification {
  String title;
  String body;
  String url;

  FCMNotification({this.title, this.body, this.url});
}

class BackgroundPage {
  static Widget getBackground(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final circle = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.lightBlueAccent.withAlpha(30)),
    );

    final circle_2 = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.grey.withAlpha(25)),
    );

    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorDark,
          ])),
        ),
        Positioned(top: 90.0, left: 30.0, child: circle),
        Positioned(top: -40.0, left: -30.0, child: circle),
        Positioned(bottom: -50.0, right: -10.0, child: circle_2),
        Positioned(bottom: 120.0, right: 20.0, child: circle_2),
        Positioned(bottom: -50.0, left: -20.0, child: circle_2)
      ],
    );
  }
}
