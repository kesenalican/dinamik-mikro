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
        stoKod: json["StokKodu"],
        stoIsim: json["StokIsim"],
      );

  Map<String, dynamic> toMap() => {
        "StokKodu": stoKod,
        "StokIsim": stoIsim,
      };
}
