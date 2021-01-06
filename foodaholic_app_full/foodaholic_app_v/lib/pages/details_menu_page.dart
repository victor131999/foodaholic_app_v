
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/providers/reservation_service.dart';

class DetailsPage extends StatefulWidget {
  final String idFoodp;
  DetailsPage({Key key, @required this.idFoodp}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
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
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
                    Text(_currentReservation.cost),
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
              placeholder: AssetImage("assets/images/FoodaHolic.png"),
              fadeInDuration: Duration(seconds: 2),
              image: NetworkImage(
                  "https://i.pinimg.com/originals/87/b2/2b/87b22b0580a03bdc1b9304a207f86d69.jpg"),
              fit: BoxFit.cover),
        ));
  }

  _loadReservation() {
    _service.getReservation(widget.idFoodp).then((value) {
      _currentReservation = value;
      print(_currentReservation);
      setState(() {});
    });
  }
}