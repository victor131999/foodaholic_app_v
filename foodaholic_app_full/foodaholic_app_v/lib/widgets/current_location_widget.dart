import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/themes/theme_main.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationWidget extends StatefulWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  _CurrentLocationWidgetState createState() => _CurrentLocationWidgetState();
  
}

class _CurrentLocationWidgetState extends State<CurrentLocationWidget> 
      with TickerProviderStateMixin {
  AnimationController _initAnimator;

  @override
  void initState() {
    super.initState();
    _initAnimator = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    Timer(Duration(milliseconds: 200), () => _initAnimator.forward());
  }

  @override
  void dispose() {
    _initAnimator.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: ThemeMain().primary,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: ThemeMain().primary,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://res.cloudinary.com/dutwlsrv9/image/upload/v1614795674/xa2zw2btcyevo3hohxs4.jpg",
                  ),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 28,
                    left: 14,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.keyboard_backspace,
                        size: 26,
                        color: ThemeMain().primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    // Información de usuario */
                    FadeTransition(
                      opacity: _initAnimator.drive(CurveTween(
                        curve: Interval(0.2, 0.7, curve: Curves.easeInCirc),
                      )),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              flex: 16,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage: NetworkImage(
                                  "https://res.cloudinary.com/dutwlsrv9/image/upload/v1614794055/ziekox59wvpm30gicxg8.png",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 59,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Manuel Cuyo",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Colors.grey[800]),
                                    ),
                                    Text(
                                      "Propietario\n0998805083",
                                      style: TextStyle(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 25,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 35,
                                    width: 35,
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      iconSize: 18,
                                      padding: EdgeInsets.all(0),
                                      color: Colors.grey[400],
                                      icon: Icon(Icons.phone),
                                      onPressed: () =>
                                          print("Pressed the Call"),
                                    ),
                                  ),
                                  Container(
                                    height: 35,
                                    width: 35,
                                    margin: EdgeInsets.only(left: 8),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: Colors.grey[200],
                                    ),
                                    child: IconButton(
                                      iconSize: 18,
                                      padding: EdgeInsets.all(0),
                                      color: Colors.grey[400],
                                      icon: Icon(Icons.chat_bubble),
                                      onPressed: () =>
                                          print("Pressed the Call"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // capacidad */
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FadeTransition(
                            opacity: _initAnimator.drive(
                              CurveTween(curve: Curves.ease),
                            ),
                            child: SlideTransition(
                              position: Tween(
                                begin: Offset(-0.6, 0),
                                end: Offset(0, 0),
                              ).animate(
                                CurvedAnimation(
                                  curve: Curves.ease,
                                  parent: _initAnimator,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      "Sucursales",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      color: Color(0xff170f58),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          FadeTransition(
                            opacity: _initAnimator.drive(
                              CurveTween(curve: Curves.ease),
                            ),
                            child: SlideTransition(
                              position: Tween(
                                begin: Offset(0.6, 0),
                                end: Offset(0, 0),
                              ).animate(
                                CurvedAnimation(
                                  curve: Curves.ease,
                                  parent: _initAnimator,
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.widgets,
                                      size: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(bottom: 4),
                                          child: Text(
                                            "60 personas",
                                            style: TextStyle(
                                              color: Color(0xff170f58),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: -1,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Capacidad",
                                          style: TextStyle(fontSize: 15),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Detalles de Sitio */
                    FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(CurvedAnimation(
                        curve: Interval(0.3, 1, curve: Curves.ease),
                        parent: _initAnimator,
                      )),
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: Offset(0, 0.3),
                          end: Offset(0, 0),
                        ).animate(CurvedAnimation(
                          curve: Interval(0.3, 1, curve: Curves.ease),
                          parent: _initAnimator,
                        )),
                        child: Container(
                          margin: EdgeInsets.only(top: 24),
                          height: 160,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "Detalles de sitio",
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Container(
                                  child: GridView.count(
                                    padding: EdgeInsets.all(0),
                                    primary: false,
                                    shrinkWrap: true,
                                    mainAxisSpacing: 12,
                                    crossAxisCount: 3,
                                    childAspectRatio: 2.3,
                                    children: <Widget>[
                                      _singleFieldProperty("Mesas", "15"),
                                      _singleFieldProperty("Baños", "2"),
                                      _singleFieldProperty("Área", "680 mt2"),
                                      _singleFieldProperty(
                                          "Antigüedad", "2015"),
                                      _singleFieldProperty("Parqueadero", "No"),
                                      _singleFieldProperty("Sector", "Pujilí"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Descripciones de sitio */
                    FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(CurvedAnimation(
                        curve: Interval(0.6, 1, curve: Curves.ease),
                        parent: _initAnimator,
                      )),
                      child: SlideTransition(
                        position: Tween(
                          begin: Offset(0, 0.3),
                          end: Offset(0, 0),
                        ).animate(
                          CurvedAnimation(
                            curve: Interval(0.6, 1, curve: Curves.ease),
                            parent: _initAnimator,
                          ),
                        ),
                        child: Container(
                          margin: EdgeInsetsDirectional.only(top: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Descripciones",
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Container(
                                margin: EdgeInsetsDirectional.only(top: 8),
                                child: Text(
                                  "El restaurante cuenta con envio a domicilio sin ningún recargo adicional dentro de la ciudad de Pujilí.\n\nSe atiende de Lunes a viernes de 08:00 am hasta 8:00 pm",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _singleFieldProperty(String key, String val) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: <Widget>[
          Text(
            key,
            style: TextStyle(
              color: Colors.grey[600],
              height: 1,
            ),
          ),
          Text(
            val,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
  
 /*Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-0.9577570609759557, -78.69691968848863),
    zoom: 18,
  );
  CameraPosition _kCurrentPosition;
  @override
  void initState(){
    super.initState();
    _determinePosition().then((value) { 
        _kCurrentPosition=CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 18,
        );
        _goToCurrentPosition() ;
    });
  }
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    print("Altura: $_heigth");

    return SingleChildScrollView(
      child: Container(
        color: Colors.orange[100],
        child: Column(
          children: [
            SizedBox(
                height: _heigth * 0.15,
                width: _width*0.90,
                child: Container(
                 decoration: BoxDecoration( 
                    image: DecorationImage(
                        image: AssetImage("assets/images/FoodaHolic.png"),
                      fit: BoxFit.cover
                    )
                  )
                )
            ),
 
            Text("Ubicación:", style: Theme.of(context).textTheme.headline4),
            Text("Calle Rafael Moralez y Antonio Jose de Sucre, a una cuadra del parque central", style: Theme.of(context).textTheme.headline6),
            SizedBox(
                width: _width*0.90,
                height: _heigth * 0.50,
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
            ),
            
            Text("Contactos:", style: Theme.of(context).textTheme.headline4),
            Text("09998805083", style: Theme.of(context).textTheme.headline5),
            Text("Atención:", style: Theme.of(context).textTheme.headline4 ),
            Text("Lunes a viernes de 08:00am hasta 10:00pm", style: Theme.of(context).textTheme.headline5),
            Text("Correo:", style: Theme.of(context).textTheme.headline4 ),
            Text("foodaholic@hotmail.com", style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }


Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permantly denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return Future.error(
          'Location permissions are denied (actual value: $permission).');
    }
  }

  return await Geolocator.getCurrentPosition();
}

Future<void> _goToCurrentPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kCurrentPosition));
  }*/
}
