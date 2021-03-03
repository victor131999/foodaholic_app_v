import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/widgets/profile/stack_container.dart';

import 'card_item.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeMain().primaryfond,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => CardItem(),
              shrinkWrap: true,
              itemCount: 1,
            )
          ],
        ),
      ),
    );
  }
}