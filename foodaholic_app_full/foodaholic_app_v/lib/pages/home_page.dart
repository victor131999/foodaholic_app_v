import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:foodaholic_app_v/widgets/form_widget.dart';
import 'package:foodaholic_app_v/widgets/various_menu_widget.dart';
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
    'Reservación'];

  final List<Widget> _pages = [
    CurrentSpecialWidget(
      key: PageStorageKey('special'),
    ),
    MainWidget(
      key: PageStorageKey('main'),
    ),
    FormWidget(
      key: PageStorageKey('Form'),
    )
  ];


  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text('FoodaHolic =>'+_titles[_selectedIndex]),
      ),
      body :PageStorage( bucket:_bucket, child: _pages[_selectedIndex]),

      bottomNavigationBar: ConvexAppBar(
        items: [
      TabItem(icon: Icons.home, title: 'Inicio'),
      TabItem(icon: Icons.food_bank, title: 'Menús'),
      TabItem(icon: Icons.food_bank_outlined, title: 'Reserva'),
    ],
    initialActiveIndex: _selectedIndex,
    onTap: _onItemTapped,
    backgroundColor: Colors.red,
      ),
    );

  }
  
}



