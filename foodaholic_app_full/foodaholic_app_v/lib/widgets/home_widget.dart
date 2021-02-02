import 'package:flutter/material.dart';
import 'various_menu_widget.dart';
import 'form_reservation_widget.dart';



class MenusWidget extends StatefulWidget {
  MenusWidget({Key key}) : super(key: key);

  @override
  _MenusWidgetState createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget> {
  final formKey = GlobalKey<FormState>();


  final List<Widget> _pages = [
    CurrentSpecialWidget(
      key: PageStorageKey('main'),
    ),
    FormWidget(
      key: PageStorageKey('Form'),
    ),

  ];

  Size screenSize;
  @override
  void initState() {
    super.initState();
  }


@override
  Widget build(BuildContext context) {
    
    screenSize = MediaQuery.of(context).size;
    return Container(
      child: buttons(),
    );

  }

  buttons(){
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
                                      builder: (context) => this.reservation(),
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
                                      builder: (context) => youVideos(),
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

  reservation() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Reservación"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[1]
      )
    );
  }

    youVideos() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Menús"),backgroundColor: Colors.yellow,),
      body: Center(
        child:_pages[2]
      )
    );
  }

  combos() {
    return new Scaffold(
      appBar: AppBar(title: new Text("Reservación"),backgroundColor: Colors.yellow),
      body: Center(
        child: _pages[3]
      )
    );
  }




}

  
