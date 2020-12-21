
class Reservations {
  List<Reservation> items = List();

  Reservations();

  Reservations.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final reservation = new Reservation.fromJsonMap(item);
      items.add(reservation);
    }
  }
}

class Reservation {
  String idreservation;
  String name;
  String cost;

  Reservation(
      {this.idreservation,
      this.name,
      this.cost,});

  Reservation.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      idreservation = json['idreservation'];
      name = json['name'];
      cost = json['cost'];
    }
  }
}