// To parse this JSON data, do
//
//     final stoklar = stoklarFromMap(jsonString);

import 'dart:convert';

Stoklar stoklarFromMap(String str) => Stoklar.fromMap(json.decode(str));

String stoklarToMap(Stoklar data) => json.encode(data.toMap());

class Stoklar {
  Stoklar({
    required this.stokKodu,
    required this.stokIsim,
    required this.stokFiyat,
    required this.stokAnaGrup,
    required this.stokSektor,
    required this.stokBirim1,
    required this.stokBirim3,
    required this.stokBirim3Katsayi,
    required this.stokReyon,
    required this.stokMarka,
    required this.stokModel,
  });

  final String stokKodu;
  final String stokIsim;
  final double stokFiyat;
  final String stokAnaGrup;
  final String stokSektor;
  final String stokBirim1;
  final String stokBirim3;
  final double stokBirim3Katsayi;
  final String stokReyon;
  final String stokMarka;
  final String stokModel;

  factory Stoklar.fromMap(Map<String, dynamic> json) => Stoklar(
    stokKodu: json["StokKodu"],
    stokIsim: json["StokIsim"],
    stokFiyat: json["StokFiyat"],
    stokAnaGrup: json["StokAnaGrup"],
    stokSektor: json["StokSektor"],
    stokBirim1: json["StokBirim1"],
    stokBirim3: json["StokBirim3"],
    stokBirim3Katsayi: json["StokBirim3_katsayi"],
    stokReyon: json["StokReyon"],
    stokMarka: json["StokMarka"],
    stokModel: json["StokModel"],
  );

  Map<String, dynamic> toMap() => {
    "StokKodu": stokKodu,
    "StokIsim": stokIsim,
    "StokFiyat": stokFiyat,
    "StokAnaGrup": stokAnaGrup,
    "StokSektor": stokSektor,
    "StokBirim1": stokBirim1,
    "StokBirim3": stokBirim3,
    "StokBirim3_katsayi": stokBirim3Katsayi,
    "StokReyon": stokReyon,
    "StokMarka": stokMarka,
    "StokModel": stokModel,
  };
}
