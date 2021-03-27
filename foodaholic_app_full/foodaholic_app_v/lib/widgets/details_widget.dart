import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/widgets/details_rest_widget.dart';
import 'package:foodaholic_app_v/widgets/details_sdk_widget.dart';

class DetailsWidget extends StatefulWidget {
  DetailsWidget({Key key}) : super(key: key);

  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: ThemeMain().primaryfond,
          appBar: AppBar(
            backgroundColor: ThemeMain().primaryAccent,
              bottom: TabBar(
            tabs: [
              Tab(text: "Menus", icon: Icon(Icons.food_bank)),
              Tab(text: "Combos", icon: Icon(Icons.fastfood)),
            ],
          )),
          body: TabBarView(
            children: [MenusRestWidget(), MenusSDKWidget()],
          ),
        ));
  }
}
