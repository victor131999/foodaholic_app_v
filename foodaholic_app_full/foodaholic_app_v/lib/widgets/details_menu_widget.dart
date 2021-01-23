import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/pages/details_menu_page.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key}) : super(key: key);

  @override
  _MenusWidgetState createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MainWidget> {
  final formKey = GlobalKey<FormState>();

  Menus _list;
  MenusService _service;

  @override
  void initState() {
    _service = new MenusService();
    super.initState();
    _loadMenus();
  }

  @override
  Widget build(BuildContext context) {
    return _list == null
        ? Center(child: Text("Cargando Servicio..."))
        : ListView(
            children: _list.items.map((e) {
            return _getMenuItem(e);
          }).toList());
  }

  _loadMenus() {
    _service.getMenus(1, 10).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  Widget _getMenuItem(Menu menu) {
    return GestureDetector(
      onTap: () {
        
        Navigator.push(
          
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(idFoodp: menu.idFood),
            )
            );
            
      },
      
      child: Card(
        elevation: 10.0,
        color: Colors.blue[100],
        
        child: ListTile(
            trailing: _getSubmitButton(),
            leading: Icon(Icons.emoji_food_beverage_outlined),
            title: Text(menu.name),
            subtitle: Text(menu.cost ?? "")),
      ),
      
    );
  }

  Widget _getSubmitButton() {
    return RaisedButton(
      elevation: 10.0,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text("Me gusta",style: TextStyle(fontSize: 10.0)),
        onPressed: _submitForm
    );
  }

  _submitForm() {
    if (!formKey.currentState.validate()) return;

    //Llamamos al servicio para guardar el Reservatione
  }

}