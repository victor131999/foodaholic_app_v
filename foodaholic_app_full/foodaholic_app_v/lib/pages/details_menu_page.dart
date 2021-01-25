
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';

class DetailsPage extends StatefulWidget {
  final String idFoodp;
  DetailsPage({Key key, @required this.idFoodp}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Menu _currentMenu;
  MenusService _service;

  @override
  void initState() {
    super.initState();
    _service = new MenusService();
    _loadMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.orange[100],
      drawerScrimColor: Colors.red,
        body: _currentMenu == null
            ? Center(
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator()))
            : CustomScrollView(
              
                slivers: [
                  
                  _appBar(_currentMenu.name),
                  SliverList(
                    
                   delegate: SliverChildListDelegate([       
                    SizedBox(height: 15.0),
                    Text( _currentMenu.name,style: TextStyle(fontSize: 50.0,color: Colors.amber[900])),
                    Text(_currentMenu.cost),
                    Text(_currentMenu.description),
                  ]
                  )
                  )
                ],
            )
    );
  }

  Widget _appBar(String title) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title,style: TextStyle(color: Colors.deepOrange[100])),
          background: FadeInImage(
              placeholder: AssetImage("assets/images/FoodaHolic.png"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(_currentMenu.image),
              fit: BoxFit.cover),
        ));
  }

  _loadMenu() {
    _service.getMenu(widget.idFoodp).then((value) {
      _currentMenu = value;
      print(_currentMenu);
      setState(() {});
    });
  }
}
