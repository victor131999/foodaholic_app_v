import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/combo_model.dart';
import 'package:foodaholic_app_v/widgets/details_combos_widget.dart';

class MenusSDKWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference menus = FirebaseFirestore.instance.collection('Combos');

    return StreamBuilder<QuerySnapshot>(
      stream: menus.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error al consultar los Combos');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: 50.0,
              width: 50.0,
              child: Center(child: CircularProgressIndicator()));
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            Combo model = Combo.fromJsonMap(document.data());
            model.idCombo = document.id;
            return DetailsCombosWidget(combo: model);
          }).toList(),
        );
      },
    );
  }
}
