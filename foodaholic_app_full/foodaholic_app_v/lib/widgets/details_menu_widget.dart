import 'package:flutter/material.dart';
import 'package:foodaholic_app_v/models/reservation_model.dart';
import 'package:foodaholic_app_v/pages/details_menu_page.dart';
import 'package:foodaholic_app_v/providers/reservation_Service.dart';

class MainWidget extends StatefulWidget {
  MainWidget({Key key}) : super(key: key);

  @override
  _ReservationsWidgetState createState() => _ReservationsWidgetState();
}

class _ReservationsWidgetState extends State<MainWidget> {
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
              builder: (context) => DetailsPage(idFoodp: reservation.idFood),
            ));
      },
      child: Card(
        elevation: 2.0,
        shadowColor: Theme.of(context).primaryColorDark,
        child: ListTile(
            trailing: Icon(Icons.arrow_right),
            leading: Icon(Icons.emoji_food_beverage_outlined),
            title: Text(reservation.name),
            subtitle: Text(reservation.cost ?? "")),
      ),
    );
  }
}