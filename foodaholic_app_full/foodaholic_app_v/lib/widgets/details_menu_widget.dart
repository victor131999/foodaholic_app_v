import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/pages/details_menu_page.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';

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
        ? Center(child: Image.asset('assets/images/loading.gif'))
        : ListView(
            children: _list.items.map((e) {
            return _getMenuItem(e);
          }).toList());
  }

  _loadMenus() {
    _service.getMenus(1, 1000000000).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  Widget _getMenuItem(Menu menu) {
    return Container(
      color: Colors.brown[100],
    child:GestureDetector(
      
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
        color: ThemeMain().primaryfond,
        
        child: ListTile(
            trailing: _getSubmitButton(),
            title: Text(menu.name),
            subtitle: Text(menu.cost ?? "")
        ),
      ),
      
    ));
  }

  Widget _getSubmitButton() {
    return RaisedButton(
        padding: const EdgeInsets.all(10.0),
        splashColor: Colors.amber,
        elevation: 0,
        color: ThemeMain().primaryfond,
        child:  Image.asset('assets/images/like.png'),
        onPressed: _submitForm
    );
  }

  _submitForm() {
    if (!formKey.currentState.validate()) return;

    //Llamamos al servicio para guardar el Reservatione
  }

}