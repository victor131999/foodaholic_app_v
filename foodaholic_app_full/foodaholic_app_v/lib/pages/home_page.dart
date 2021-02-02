import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:foodaholic_app_v/widgets/current_location_widget.dart';
import 'package:foodaholic_app_v/widgets/form_reservation_widget.dart';
import 'package:foodaholic_app_v/widgets/form_report_widget.dart';
import 'package:foodaholic_app_v/widgets/home_widget.dart';
import 'package:foodaholic_app_v/widgets/profile_widget.dart';
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
    FormWidget(
      key: PageStorageKey('Form'),
    ),
    FormReportWidget(
      key: PageStorageKey('FormReport'),
    ),
    CurrentLocationWidget(
      key: PageStorageKey('location'),
    ),
    ProfileWidget(
      key: PageStorageKey('profile'),
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
      backgroundColor:Colors.orange[100],
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
            color: Colors.orange[200],
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
            color: Colors.orange[200],
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
            color: Colors.orange[200],
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
        backgroundColor: Colors.yellow,
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
          TabItem(icon: Icons.food_bank, title: 'Menús'),
          TabItem(icon: Icons.food_bank_outlined, title: 'Reserva'),
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
      appBar: AppBar(title: new Text("Perfil"),backgroundColor: Colors.yellow,),
      body: Center(
        child:_pages[5]
      )
    );
  }

  information() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Información"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[4]
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

  
}





