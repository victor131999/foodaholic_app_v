
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
  String idFood;
  String name;
  String cost;

  Reservation(
      {this.idFood,
      this.name,
      this.cost,});

  Reservation.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      idFood = json['idFood'];
      name = json['name'];
      cost = json['cost'];
    }
  }
}