import 'dart:convert';

Reservation reportFromJson(String str) => Reservation.fromJson(json.decode(str));

String reportToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.idreservation,
    this.date,
    this.user,
    this.type = 'VIP',
    this.image,
    this.message,
  });

  String idreservation;
  String date;
  String user;
  String type;
  String image;
  String message;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        idreservation: json["idreservation"],
        date: json["date"],
        user: json["user"],
        type: json["type"],
        image: json["image"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "idreservation": idreservation,
        "date": date,
        "user": user,
        "type": type,
        "image": image,
        "message": message,
      };
}