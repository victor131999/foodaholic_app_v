import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';
import 'combos_widget.dart';
import 'drinks_widget .dart';
import 'various_menu_widget.dart';
import 'form_reservation_widget.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.Dart';

class MenusWidget extends StatefulWidget {
  MenusWidget({Key key}) : super(key: key);

  @override
  _MenusWidgetState createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget> {
  final formKey = GlobalKey<FormState>();
  Menus _list;
  MenusService _service;
  Size screenSize;

  final List<Widget> _pages = [
    CurrentSpecialWidget(
      key: PageStorageKey('main'),
    ),
    DrinksWidget(
      key: PageStorageKey('bebida'),
    ),
    CombosWidget(
      key: PageStorageKey('combo'),
    ),
    FormWidget(
      key: PageStorageKey('reservation'),
    ),


  ];

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
  ]);
    _service = new MenusService();
    super.initState();
    _loadMenus();
  }
int _current = 0;

@override
  Widget build(BuildContext context) {
    
    screenSize = MediaQuery.of(context).size;
    return _list == null
        ? Center(child: Text("Cargando Opciones..."))
        :Container(
      child: options(),
    );

  }

  options(){
    double _heigth = MediaQuery.of(context).size.height;
    double  _width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: _heigth * 60,
            width: _width * 60,
            decoration: BoxDecoration(
              color: Colors.orange[100],
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Text(
                        'Fooda Holic',
                        style: TextStyle(
                          fontSize: 54,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 4
                            ..color = Colors.black54,
                        ),
                      ),
                      alignment: Alignment.center,
                      height: 65,
                      width: 600,    
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: carrucel(),
                      alignment: Alignment.center,
                      height: 197,
                      width: 600,    
                    ),
                  ),
                  
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.95,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(1),
                          elevation: 20,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            child: Material(
                              color: Colors.redAccent,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => menus(),
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 160,
                                          width: 700,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2BEA1),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                              alignment: Alignment.center,
                                              image: AssetImage("assets/images/menu.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                         ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(1),
                          elevation: 20,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            child: Material(
                              color: Colors.redAccent,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => drinks(),
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 160,
                                          width: 700,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2BEA1),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                              alignment: Alignment.center,
                                              image: AssetImage("assets/images/juice.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                         ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(1),
                          elevation: 20,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            child: Material(
                              color: Colors.redAccent,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => combos(),
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 160,
                                          width: 700,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2BEA1),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                              alignment: Alignment.center,
                                              image: AssetImage("assets/images/cinta.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                         ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          margin: EdgeInsets.all(1),
                          elevation: 20,
                          child: ClipRRect(
                          borderRadius: BorderRadius.circular(13),
                          child: Container(
                            child: Material(
                              color: Colors.redAccent,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => reservation(),
                                    )
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 160,
                                          width: 700,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF2BEA1),
                                            shape: BoxShape.rectangle,
                                            image: DecorationImage(
                                              alignment: Alignment.center,
                                              image: AssetImage("assets/images/reserved.png"),
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                         ),
                        ),
                      ],
                    ),
                    
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  menus() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Menús"),backgroundColor: Colors.yellow,),
      body: Center(
        child:_pages[0]
      )
    );
  }

  drinks() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Bebidas"),backgroundColor: Colors.yellow,),
      body: Center(
        child:_pages[1]
      )
    );
  }

  combos() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Ofertas y combos"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[2]
      )
    );
  }

  reservation() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Reservación"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[3]
      )
    );
  }




    _loadMenus() {
    _service.getMenus(1, 6).then((value) {
      setState(() {
        _list = value;
      });
    });
  }


   carrucel(){
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
              viewportFraction: 0.90,
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
            children: _list.items.map((item) {
              int index = _list.items.indexOf(item);
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




}

  
