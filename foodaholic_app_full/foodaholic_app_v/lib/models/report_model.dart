import 'dart:convert';

Report reportFromJson(String str) => Report.fromJson(json.decode(str));

String reportToJson(Report data) => json.encode(data.toJson());

class Report {
  Report({
    this.idreport,
    this.date,
    this.user,
    this.type = 'Sugerencia',
    this.image,
    this.message,
  });

  String idreport;
  String date;
  String user;
  String type;
  String image;
  String message;

  factory Report.fromJson(Map<String, dynamic> json) => Report(
        idreport: json["idreport"],
        date: json["date"],
        user: json["user"],
        type: json["type"],
        image: json["image"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "idreport": idreport,
        "date": date,
        "user": user,
        "type": type,
        "image": image,
        "message": message,
      };
}