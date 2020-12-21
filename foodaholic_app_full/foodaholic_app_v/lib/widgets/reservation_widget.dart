import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:foodaholic_app_v/pages/reservation_page.dart';
import 'package:foodaholic_app_v/providers/reservation_Service.dart';

class ReservationWidget extends StatefulWidget {
  ReservationWidget({Key key}) : super(key: key);

  @override
  _ReservationsWidgetState createState() => _ReservationsWidgetState();
}

class _ReservationsWidgetState extends State<ReservationWidget> {
  Reservations _list;
  ReservationsService _service;

  @override
  void initState() {
    _service = new ReservationsService();
    super.initState();
    _loadReservations();
  }

  @override
  Widget build(BuildContext context) {
    return _list == null
        ? Center(child: Text("Cargando Servicio..."))
        : ListView(
            children: _list.items.map((e) {
            return _getReservationItem(e);
          }).toList());
  }

  _loadReservations() {
    _service.getReservations(1, 10).then((value) {
      setState(() {
        _list = value;
      });
    });
  }

  Widget _getReservationItem(Reservation reservation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReservationPage(idReservation: reservation.idreservation),
            ));
      },
      child: Card(
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.airport_shuttle),
            title: Text(reservation.name),
            subtitle: Text(reservation.cost ?? "")),
      ),
    );
  }
}