
import 'dart:convert';

Stoklar stoklarFromMap(String str) => Stoklar.fromMap(json.decode(str));

String stoklarToMap(Stoklar data) => json.encode(data.toMap());

class Stoklar {
  Stoklar({
    required this.stoKod,
    required this.stoIsim,
  });

  final String stoKod;
  final String stoIsim;

  factory Stoklar.fromMap(Map<String, dynamic> json) => Stoklar(
    stoKod: json["sto_kod"],
    stoIsim: json["sto_isim"],
  );

  Map<String, dynamic> toMap() => {
    "sto_kod": stoKod,
    "sto_isim": stoIsim,
  };
}
