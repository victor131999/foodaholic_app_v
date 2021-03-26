import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:foodaholic_app_v/models/user_model.dart';
import 'package:foodaholic_app_v/pages/settings_page.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/utils/preferences.dart';
import 'package:foodaholic_app_v/utils/utils.dart';
import 'package:foodaholic_app_v/widgets/information_widget.dart';
import 'package:foodaholic_app_v/widgets/form_report_widget.dart';
import 'package:foodaholic_app_v/widgets/home_widget.dart';
import 'package:foodaholic_app_v/widgets/list_sqlite_widget.dart';
import 'package:foodaholic_app_v/widgets/profile/profile_widget.dart';
import 'package:foodaholic_app_v/widgets/details_menu_widget.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final prefs = new Preferences();
  User currentUser;
    @override
  void initState() {
    super.initState();
    _configFCM();
    _getUserValues();
  }
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  
    _getContent(Map<dynamic, dynamic> message) {
    FCMNotification content = new FCMNotification();
    if (Platform.isIOS) {
      content.title = message['aps']['alert']['title'];
      content.body = message['aps']['alert']['body'];
      content.url = message['url'];
    } else {
      Map<dynamic, dynamic> notification = message['notification'];
      Map<dynamic, dynamic> data = message['data'];
      content.title = notification['title'];
      content.body = notification['body'];
      content.url = data['url'];
    }
    return content;
  }
    _goNotification(Map<dynamic, dynamic> message) {
    FCMNotification content = _getContent(message);
    if (content != null) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    child: Text(content.title)),
                content: Container(
                  margin: EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(content.body)),
                      content.url == null
                          ? Container()
                          : Image.network(content.url)
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                    padding: EdgeInsets.zero,
                    child: Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ]);
          });
    }
  }
  final PageStorageBucket _bucket = PageStorageBucket();
  int _selectedIndex=0;

  final List<String> _titles = [
    'Inicio',
    'Menú',
    'Reservación',
    'Sugerencias y reportes'];

  final List<Widget> _pages = [
    MenusWidget(
      key: PageStorageKey('Home'),
      
    ),
    MainWidget(
      key: PageStorageKey('main'),
    ),
    FormReportWidget(
      key: PageStorageKey('FormReport'),
    ),
    InformationWidget(
      key: PageStorageKey('information'),
    ),
    ProfileWidget(
      key: PageStorageKey('profile'),
    ),
    ListSqliteWidget(
      key: PageStorageKey('listfavorites'),
    ),

  ];


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ThemeMain().primaryfond,
      drawer: new Drawer(//navigation drawer
        
      child: ListView(
        
        children: <Widget>[

          new UserAccountsDrawerHeader(
            
              accountName: Text("Victor Cuyo",),
              accountEmail: Container(
                  margin: EdgeInsets.only(bottom: 14.0),
                  child: Text(currentUser == null
                      ? ""
                      : currentUser.name == null
                          ? currentUser.email
                          : currentUser.name)),
            decoration: BoxDecoration( 
              
              image: DecorationImage(
                  image: AssetImage("assets/images/FoodaHolic.png"),
                fit: BoxFit.cover
              )
            ),
          ),
          Ink(
            color: ThemeMain().primaryfond,
            child: new ListTile(
              title: Text("Tu perfil"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => perfil()
                  )
                );
              },
            ),
          ),
           Ink(
            color: ThemeMain().primaryfond,
            child: new ListTile(
              title: Text("Información del restaurante"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => information()
                  )
                );
              },
            ),
          ),
          Ink(
            color: ThemeMain().primaryfond,
            child: new ListTile(
              title: Text("Favoritos"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => favorites()
                  )
                );
              },
            ),
          ),
           Ink(
            color: ThemeMain().primaryfond,
            child: new ListTile(
              title: Text("Configuración"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingsPage()
                  )
                );
              },
            ),
          ),
          Ink(
            color: ThemeMain().primaryfond,
            child: new ListTile(
              title: Text("Salir de tu cuenta"),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => salir()
                  )
                );
              },
            ),
          ),
        ],
      ) ,
    ),

      appBar: AppBar(
        backgroundColor: ThemeMain().primary,
        centerTitle: true,
        title: Text(_titles[_selectedIndex]),
      ),
      body :PageStorage(
        
         bucket:_bucket, 
         child: _pages[_selectedIndex]
      ),

      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.home, title: 'Inicio'),
          TabItem(icon: Icons.food_bank, title: 'Nutrición'),
          TabItem(icon: Icons.report,title: 'Reporte'),
        ],
        initialActiveIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.deepOrange,
      ),
      
    );

  }

  void _iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});
  }

  _configFCM() {
    if (Platform.isIOS) _iOSPermission();

    _firebaseMessaging.configure(
      onMessage: (Map<dynamic, dynamic> message) async {
        _goNotification(message);
      },
      onResume: (Map<dynamic, dynamic> message) async {
        _goNotification(message);
      },
      onLaunch: (Map<dynamic, dynamic> message) async {
        _goNotification(message);
      },
    );
  }
 
  perfil() {
    return new Scaffold(
      body: Center(
        child:_pages[4]
      )
    );
  }

  information() {
    return new Scaffold(
      body: Center(
        child: _pages[3]
      )
    );
  }

  salir() {
    return new Scaffold(
      appBar: AppBar(title: new Text("salir"),backgroundColor: Colors.yellow),
      body: Center(
        child: Text("salir")
      )
    );
  }
  favorites() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Favoritos"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[5]
      )
    );
  }

    _getUserValues() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(prefs.token);
    print(decodedToken);
    currentUser = User.fromJsonMap(decodedToken);
    setState(() {});
  }
}





