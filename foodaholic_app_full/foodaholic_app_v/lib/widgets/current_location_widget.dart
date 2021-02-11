import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationWidget extends StatefulWidget {
  const CurrentLocationWidget({Key key}) : super(key: key);

  @override
  _CurrentLocationWidgetState createState() => _CurrentLocationWidgetState();
}

class _CurrentLocationWidgetState extends State<CurrentLocationWidget> {
 Completer<GoogleMapController> _controller = Completer();

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
  }

}