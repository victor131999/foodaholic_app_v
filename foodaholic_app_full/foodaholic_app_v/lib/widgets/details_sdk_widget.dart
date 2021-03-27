import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/widgets/details_menu_widget.dart';

class MenusSDKWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference menus = FirebaseFirestore.instance.collection('Foods');

    return StreamBuilder<QuerySnapshot>(
      stream: menus.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error al consultar las menus');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              height: 50.0,
              width: 50.0,
              child: Center(child: CircularProgressIndicator()));
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            Menu model = Menu.fromJsonMap(document.data());
            model.idFood = document.id;
            return DetailsCardWidget(menu: model);
          }).toList(),
        );
      },
    );
  }
}
