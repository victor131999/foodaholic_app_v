import 'dart:convert';

Reservation reportFromJson(String str) => Reservation.fromJson(json.decode(str));

String reportToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.idreservation,
    this.date,
    this.user,
    this.email,
    this.identity,
    this.name,
    this.phone,
    this.totalperson
  });

  String idreservation;
  String date;
  String user;
  String email;
  String identity;
  String name;
  String phone;
  String totalperson;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservation: json["idreservation"],
        date: json["date"],
        user: json["user"],
        email: json["email"],
        identity: json["identity"],
        name: json["name"],
        phone: json["phone"],
        totalperson: json["totalperson"],
      );

  Map<String, dynamic> toJson() => {
        "idreservation": idreservation,
        "date": date,
        "user": user,
        "email": email,
        "identity": identity,
        "name": name,
        "phone": phone,
        "totalperson": totalperson,
      };
}