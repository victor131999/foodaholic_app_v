
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/menu_model.dart';
import 'package:foodaholic_app_v/models/menu_sqlite_model.dart';
import 'package:foodaholic_app_v/providers/menu_Service.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
import 'package:foodaholic_app_v/utils/database_utils.dart';

class DetailsPage extends StatefulWidget {
  final String idFoodp;
  DetailsPage({Key key, @required this.idFoodp}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Menu _currentMenu;
  MenusService _service;
  SMenu _smenu = SMenu();
  final _formKey = GlobalKey<FormState>();

  DatabaseHelper _dbHelper;
  @override
  void initState() {
    super.initState();
    _service = new MenusService();
    _loadMenu();
      setState((){
    _dbHelper = DatabaseHelper.instance;
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.orange[100],
      drawerScrimColor: ThemeMain().primary,
        body: _currentMenu == null
            ? Center(
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator()))
            : CustomScrollView(
              
                slivers: [
                  
                  _appBar(_currentMenu.name),
                  SliverList(
                    
                   delegate: SliverChildListDelegate([ 

                           
                    SizedBox(height: 15.0),
                    Text( _currentMenu.name,style: TextStyle(fontSize: 50.0,color: Colors.amber[900])),
                    Text(_currentMenu.cost,style: TextStyle(fontSize: 30.0,color: ThemeMain().primaryDark)),
                    Text(_currentMenu.description),
                    _form()
                  ]
                  )
                  ),

                  
                ],
                
            ),
    );
  }
  
  Widget _appBar(String title) {
    return SliverAppBar(
        backgroundColor: ThemeMain().primary,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title,style: TextStyle(color: Colors.deepOrange[100])),
          background: FadeInImage(
              placeholder: AssetImage("assets/images/FoodaHolic.png"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(_currentMenu.image),
              fit: BoxFit.cover),
        ));
  }

  _loadMenu() {
    _service.getMenu(widget.idFoodp).then((value) {
      _currentMenu = value;
      print(_currentMenu);
      setState(() {});
    });
  }
    _form() => Container(
    color: ThemeMain().primaryfond,
    padding: EdgeInsets.symmetric(vertical:20,horizontal:30),
    child:Form(
        key: _formKey,
        child: Column(
          children: <Widget> [
             Container(
              margin: EdgeInsets.all(100.0),
              child:RaisedButton(
                padding: const EdgeInsets.all(10.0),
                splashColor: Colors.amber,
                elevation: 0,
                color: ThemeMain().primaryfond,
                child:  Image.asset('assets/images/like.png'),
                onPressed: ()=> _onSubmit(),
              ),
            ),
            
            TextFormField(
              //decoration:  InputDecoration(labelText:  _currentMenu.name),
              onSaved: (val) => setState(() => _smenu.name = _currentMenu.name),
              validator: (val)=>(val.length!=0 ? 'El campo es obligatorio':null),
            ),
            TextFormField(
              //decoration: InputDecoration(labelText:  _currentMenu.cost),
              onSaved: (val) => setState(() => _smenu.cost =  _currentMenu.cost),
              validator: (val)=>(val.length!=0 ? 'El campo es obligatorio':null),
            ),
            TextFormField(
              //decoration:  InputDecoration(labelText:  _currentMenu.description),
              onSaved: (val) => setState(() => _smenu.description =  _currentMenu.description),
              validator: (val)=>(val.length!=0 ? 'El campo es obligatorio':null),
            ),

            
           
          ],
        ),
    )
  );

  _onSubmit() async{
    var form = _formKey.currentState;
    if(form.validate()){
      form.save();
      await _dbHelper.insertSMenu(_smenu);
    }
}
}
