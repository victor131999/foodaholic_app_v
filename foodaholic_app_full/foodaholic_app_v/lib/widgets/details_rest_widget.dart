import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/providers/menu_service.dart';
import 'package:foodaholic_app_v/widgets/details_menu_widget.dart';

class MenusRestWidget extends StatefulWidget {
  MenusRestWidget({Key key}) : super(key: key);

  @override
  _MenusRestWidgetState createState() => _MenusRestWidgetState();
}

class _MenusRestWidgetState extends State<MenusRestWidget> {
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
            return DetailsCardWidget(menu: e);
          }).toList());
  }

  _loadMenus() {
    _service.getMenus(1, 10000000000).then((value) {
      if (mounted) {
        setState(() {
          _list = value;
        });
      }
    });
  }
}
