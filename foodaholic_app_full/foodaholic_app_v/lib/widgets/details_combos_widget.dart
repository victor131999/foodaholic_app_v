import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/combo_model.dart';
import 'package:foodaholic_app_v/pages/details_combo_page.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';

class DetailsCombosWidget extends StatelessWidget {
  final Combo combo;
  const DetailsCombosWidget({Key key, @required this.combo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsComboPage(idCombop: combo.idCombo),
            ));
      },
      child: Card(
        color: ThemeMain().primaryfond,
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.food_bank_rounded),
            title: Text(combo.fusion),
            subtitle: Text(combo.cost ?? "")),
      ),
    );
  }
}
