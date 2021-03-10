import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:foodaholic_app_v/pages/settings_page.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/widgets/information_widget.dart';
import 'package:foodaholic_app_v/widgets/form_report_widget.dart';
import 'package:foodaholic_app_v/widgets/home_widget.dart';
import 'package:foodaholic_app_v/widgets/list_sqlite_widget.dart';
import 'package:foodaholic_app_v/widgets/profile/profile_widget.dart';
import 'package:foodaholic_app_v/widgets/details_menu_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
              accountEmail: Text("vhcuyo@espe.edu.ec"),
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

  
}





