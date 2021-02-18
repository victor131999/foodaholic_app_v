import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/drink_model.dart';
import 'package:foodaholic_app_v/providers/drink_Service.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';

class DrinksWidget extends StatefulWidget {
  DrinksWidget({Key key}) : super(key: key);

  @override
  _DrinksWidgetState createState() => _DrinksWidgetState();
}

class _DrinksWidgetState extends State<DrinksWidget> {
  final formKey = GlobalKey<FormState>();
  Drinks _list;
  DrinksService _service;
  Size screenSize;
  @override
  void initState() {
    _service = new DrinksService();
    super.initState();
    _loadDrinks();
  }

@override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    screenSize = MediaQuery.of(context).size;
    return _list == null
        ? Center(child: Text("Cargando bebidas..."))
        :SingleChildScrollView(
      child: Container(
        color: ThemeMain().primaryfond,
        child: Column(
          children: [
            Title(color: Colors.amber, child: Text(
                        'Bebidas',
                        style: TextStyle(
                          fontSize: 54,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black54,
                        ),
                      ),),
            SizedBox(
                height: _heigth * 0.8,
                child: Container(
                  child: _down(),
                )
            ),
          ],
        ),
      ),
    );

    //CODIGO PARA PONER UN DESLIZANTE
   /* return Scaffold(
      
     body:  Container(
        color: Colors.brown[100],
        padding:
            EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0, bottom: 15.0),
        child: Container(
          color: Colors.orange[100],
          
                child: PageView(
                  children: <Widget>[_carrucel(),_down()],
                
                )
              ),
            ),
    );*/
    
    
  }

  _loadDrinks() {
    _service.getDrinks(1, 100000).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

 _down() {
    return GridView.count(
      crossAxisCount: 2,
      children:  _list.items.map( (item) {
        return Center(     
          child: Container( 
            width: screenSize.width*0.48,   
            height: screenSize.height*0.251,   
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber, width: 6.0),
            ),
            padding: const EdgeInsets.all(0.0),
            child: Stack(
              children: <Widget>[
                Image.network(item.image, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 7.0),
                    child: Text(
                      '${item.name}',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${item.cost}',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold, 
                          ),
                        ),
                      )
                ),
              ],
              
            ),
          ),
        );
      }
      ).toList(),
    );
  }

}

  
