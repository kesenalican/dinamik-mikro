// To parse this JSON data, do
//
//     final vergiDaireModel = vergiDaireModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

VergiDaireModel vergiDaireModelFromMap(String str) =>
    VergiDaireModel.fromMap(json.decode(str));

String vergiDaireModelToMap(VergiDaireModel data) => json.encode(data.toMap());

class VergiDaireModel {
  VergiDaireModel({
    required this.vergDaireKodu,
    required this.vergiDaireAdi,
    required this.vergiDaireIl,
  });
  final String vergDaireKodu;
  final String vergiDaireAdi;
  final String vergiDaireIl;

  factory VergiDaireModel.fromMap(Map<String, dynamic> json) => VergiDaireModel(
        vergDaireKodu: json["VergDaireKodu"],
        vergiDaireAdi: json["VergiDaireAdi"],
        vergiDaireIl: json["VergiDaireIl"],
      );

  Map<String, dynamic> toMap() => {
        "VergDaireKodu": vergDaireKodu,
        "VergiDaireAdi": vergiDaireAdi,
        "VergiDaireIl": vergiDaireIl,
      };
}
