import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/providers/content_provider.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final prefs = new Preferences();
    final _contentProvider = Provider.of<ContentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Modo nocturno"),
            leading: Checkbox(
                value: prefs.mode,
                onChanged: (value) {
                  prefs.mode = value;
                  _contentProvider.darkMode = prefs.mode;
                  if (prefs.mode) {
                    print("Modo nocturno activado");
                  } else {
                    print("Modo nocturno desactivado");
                  }
                  setState(() {});
                }),
          ),
          /*RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Borrar usuario'),
            ),
            textColor: Theme.of(context).primaryColorDark,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              prefs.token = "";
              _contentProvider.token = prefs.token;
              setState(() {});
            },
          )*/
        ],
      ),
    );
  }
}