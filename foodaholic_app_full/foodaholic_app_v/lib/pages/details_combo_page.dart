import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/combo_model.dart';
import 'package:foodaholic_app_v/providers/combo_Service.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';


class DetailsComboPage extends StatefulWidget {
  final String idCombop;
  DetailsComboPage({Key key, @required this.idCombop}) : super(key: key);

  @override
  _DetailsComboPageState createState() => _DetailsComboPageState();
}

class _DetailsComboPageState extends State<DetailsComboPage> {
  Combo _currentCombo;
  CombosService _service;

  @override
  void initState() {
    super.initState();
    _service = new CombosService();
    _loadMenu();
      setState((){

  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.orange[100],
      drawerScrimColor: ThemeMain().primary,
        body: _currentCombo == null
            ? Center(
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator()))
            : CustomScrollView(
              
                slivers: [
                  
                  _appBar(_currentCombo.fusion),
                  SliverList(
                   delegate: SliverChildListDelegate([        
                    SizedBox(height: 15.0),
                    Text( _currentCombo.fusion,style: TextStyle(fontSize: 50.0,color: Colors.amber[900])),
                    Text(_currentCombo.cost,style: TextStyle(fontSize: 30.0,color: ThemeMain().primaryDark)),
                    Text(_currentCombo.description),
                  ]
                  )
                  ),

                  
                ],
                
            ),
    );
  }
  
  Widget _appBar(String title) {
    return SliverAppBar(
        backgroundColor: ThemeMain().primary,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title,style: TextStyle(color: Colors.deepOrange[100])),
          background: FadeInImage(
              placeholder: AssetImage("assets/images/FoodaHolic.png"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(_currentCombo.image),
              fit: BoxFit.cover),
        ));
  }

  _loadMenu() {
    _service.getCombo(widget.idCombop).then((value) {
      _currentCombo = value;
      print(_currentCombo);
      setState(() {});
    });
  }


}
