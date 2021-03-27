import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/pages/details_menu_page.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';

class DetailsCardWidget extends StatelessWidget {
  final Menu menu;
  const DetailsCardWidget({Key key, @required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(idFoodp: menu.idFood),
            ));
      },
      child: Card(
        color: ThemeMain().primaryfond,
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.food_bank_rounded),
            title: Text(menu.name),
            subtitle: Text(menu.cost ?? "")),
      ),
    );
  }
}
