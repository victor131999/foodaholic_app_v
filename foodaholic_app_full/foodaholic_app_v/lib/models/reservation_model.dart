import 'dart:convert';

Reservation reservationFromJson(String str) => Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.idreservation,
    this.date,
    this.user,
    this.message,
  });

  String idreservation;
  DateTime date;
  String user;
  String message;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservation: json["idreservation"],
        date: DateTime.parse(json["date"]),
        user: json["user"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "idreservation": idreservation,
        "date": date.toIso8601String(),
        "user": user,
        "message": message,
      };
}