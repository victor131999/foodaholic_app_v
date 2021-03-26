import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/user_model.dart';
import 'package:foodaholic_app_v/pages/login_page.dart';
import 'package:foodaholic_app_v/providers/content_provider.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  _CardItemState createState() => _CardItemState();
}

  final List<Widget> _pages = [
    LoginPage(
      key: PageStorageKey('Sesion'),   
    ),
  ];

class _CardItemState extends State<CardItem> {
  final prefs = new Preferences();
  User currentUser;
      @override
  void initState() {
    super.initState();
    _getUserValues();
  }

  @override
  Widget build(BuildContext context) {
    final prefs = new Preferences();
    final _contentProvider = Provider.of<ContentProvider>(context);
    return Column(
    children:<Widget>[ 
        Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 21.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //r¿se puede precionar en el icono
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.perm_identity,
                    size: 40.0,
                    color: ThemeMain().fondanime,
                  ),
                ),
                SizedBox(width: 24.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Cédula",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "0504426362",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 21.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.email,
                    size: 40.0,
                    color: ThemeMain().fondanime,
                  ),
                ),
                SizedBox(width: 24.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Correo",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Container(
                  margin: EdgeInsets.only(bottom: 14.0),
                  child: Text(currentUser == null
                      ? ""
                      : currentUser.name == null
                          ? currentUser.email
                          : currentUser.name)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 21.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.directions,
                    size: 40.0,
                    color: ThemeMain().fondanime,
                  ),
                ),
                SizedBox(width: 24.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Dirección",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Pujilí",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
              child: Text('Salir de la cuenta'),
            ),
            textColor: Theme.of(context).primaryColorDark,
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              prefs.token = "";
              _contentProvider.token = prefs.token;
              //setState(()=> {_session()});
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => _session()),
                  );
            },
          )

    ]
    );
  }

      _getUserValues() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(prefs.token);
    print(decodedToken);
    currentUser = User.fromJsonMap(decodedToken);
    setState(() {});
  }
  
  _session() {
    return new Scaffold(
      body: Center(
        child:_pages[0]
      )
    );
  }

}
