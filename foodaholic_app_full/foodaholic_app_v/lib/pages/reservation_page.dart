
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/providers/reservation_service.dart';

class ReservationPage extends StatefulWidget {
  final String idReservation;
  ReservationPage({Key key, @required this.idReservation}) : super(key: key);

  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  Reservation _currentReservation;
  ReservationsService _service;

  @override
  void initState() {
    super.initState();
    _service = new ReservationsService();
    _loadReservation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentReservation == null
            ? Center(
                child: Container(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator()))
            : CustomScrollView(
                slivers: [
                  _appBar(_currentReservation.name),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    SizedBox(height: 15.0),
                    Text(_currentReservation.name),
                    Text(_currentReservation.cost),
                    SizedBox(height: 550.0),
                  ]))
                ],
              ));
  }

  Widget _appBar(String title) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        pinned: true,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(title),
          background: FadeInImage(
              placeholder: AssetImage("assets/images/latacunga.jpg"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(
                  "https://dam.cocinafacil.com.mx/wp-content/uploads/2020/04/comida-china-tipica.jpg"),
              fit: BoxFit.cover),
        ));
  }

  _loadReservation() {
    _service.getReservation(widget.idReservation).then((value) {
      _currentReservation = value;
      print(_currentReservation);
      setState(() {});
    });
  }
}