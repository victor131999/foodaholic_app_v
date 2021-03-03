import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/pages/home_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => _home()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
    );
  }
   
    _home() {
      final List<Widget> _pages = [
    HomePage(
      key: PageStorageKey('Home'),
      
    ),

  ];
    return  
        _pages[0];
  }
}
