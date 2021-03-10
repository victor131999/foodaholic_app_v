
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_sqlite_model.dart';
import 'package:foodaholic_app_v/utils/database_utils.dart';

class ListSqliteWidget extends StatefulWidget {
  const ListSqliteWidget({Key key}) : super(key: key);

  @override
  _ListSqliteWidgetState createState() => _ListSqliteWidgetState();
  
}

class _ListSqliteWidgetState extends State<ListSqliteWidget> {
  List<SMenu> _smenus =[];
  DatabaseHelper _dbHelper;

  @override
  void initState(){
    super.initState();
      setState((){
    _dbHelper = DatabaseHelper.instance;
  });
  _refreshPersonList();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           _list()
          ],
        ),
      ),
    );
  }

  _refreshPersonList() async{
    List<SMenu> x = await _dbHelper.fetchSMenus();
    setState(() {
      _smenus = x;
    });
  }

  _list() =>Expanded(
    child: Card(
      margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context,index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.food_bank_outlined,
                size:40
                ),
                title: Text("Menu: "+_smenus[index].name.toUpperCase()),
                subtitle: Text("Costo: "+_smenus[index].cost.toUpperCase()+"\n"+"Descripción:"+_smenus[index].description.toUpperCase()),
              ),
              Divider(height: 5.0,)
            ],
          );
        },

        itemCount: _smenus.length,
      ),
    
    ),
  );

}