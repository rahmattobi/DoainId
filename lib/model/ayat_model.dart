// To parse this JSON data, do
//
//     final ayat = ayatFromJson(jsonString);

import 'dart:convert';

List<Ayat> ayatFromJson(String str) =>
    List<Ayat>.from(json.decode(str).map((x) => Ayat.fromJson(x)));

String ayatToJson(List<Ayat> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Ayat {
  Ayat({
    this.ar,
    this.id,
    this.tr,
    this.nomor,
  });

  String? ar;
  String? id;
  String? tr;
  String? nomor;

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        ar: json["ar"],
        id: json["id"],
        tr: json["tr"],
        nomor: json["nomor"],
      );

  Map<String, dynamic> toJson() => {
        "ar": ar,
        "id": id,
        "tr": tr,
        "nomor": nomor,
      };
}
