import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';

class CurrentSpecialWidget extends StatefulWidget {
  CurrentSpecialWidget({Key key}) : super(key: key);

  @override
  _CurrentWidgetState createState() => _CurrentWidgetState();
}

class _CurrentWidgetState extends State<CurrentSpecialWidget> {
  final formKey = GlobalKey<FormState>();
  List<Menu> _listAux = List();
  Menus _list;
  MenusService _service;
  Size screenSize;
  @override
  void initState() {
    _service = new MenusService();
    super.initState();
    _loadMenus();
  }
   int _current = 0;

@override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");
    screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SizedBox(
                height: _heigth * 0.25,
                child: Container(  
                  child: _carrucel(),
                )
            ),
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
  

 /*Name() {
    return  ListView(
            children: _list.items.map((e) {
            return _getNameItem(e);
          }).toList()
          );
  }


  ImageLink() {
    return  ListView(
            children: _list.items.map((e) {
            return _getImageItem(e);
          }).toList()
          );
  }*/
  _loadMenus() {
    _service.getMenus(1, 6).then((value) {
      setState(() {
        _list = value;
        
        
      });
    });
  }

  /*Widget _getNameItem(Menu menu) {
    return 
            Text(menu.name);
  }

  Widget _getImageItem(Menu menu) {
    return 
            Text(menu.image);
  }*/


 _carrucel(){
  final List<Widget> carrouselItem = _list.items.map((item)=> Container(
  child: Container(
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Text(
                      'Especial ${_list.items.indexOf(item)+1} ${item.name}',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        
                      ),
                    ),
                  ),
                ),
                
              ],
              
            )
            
          ),
    
  ),
  
)).toList();

    return Container(
      
      child: Column(
        
        children: [
          CarouselSlider(
            items: carrouselItem,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.30,
              onPageChanged: (index, reason) {
                 {
                  _current = index;
                }
              }
            ),
            
          ),
          
          Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: _list.items.map((url) {
              int index = _list.items.indexOf(url);
              return Container(
                
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                    ? Color.fromRGBO(0, 0, 0, 0.9)
                    : Color.fromRGBO(0, 0, 0, 0.4),
                ),
                
              );
              
            }).toList(),
            
          ),
          
        ]
        
      ),

    );
}

 _down() {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      // Generate 100 Widgets that display their index in the List
      children:  _list.items.map( (item) {
        return Center(     
          child: Container( 
            width: screenSize.width*0.48,   
            height: screenSize.height*0.251,   
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 6.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Especial ${_list.items.indexOf(item)+1} ${item.name}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        );
      }
      ).toList(),
    );
  }

}

  
