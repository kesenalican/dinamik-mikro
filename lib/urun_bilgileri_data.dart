import 'package:flutter/material.dart';

List urunBilgileri = [
  {
    "name": "Ürün Kodu",

  },
  {
    "name": "Ürün Adı",

  },
  {
    "name": "Barkod",

  },
  {
    "name": "Barkod",

  },
  {
    "name": "Bakiye",

  },
  {
    "name": "Birim",

  },
  {
    "name": "Birim-2",

  },
  {
    "name": "Birim-3",

  },
  {
    "name": "KDV %18",

  },
  {
    "name": "Kategori",

  },
  {
    "name": "Ana Grup",

  },
  {
    "name": "Alt Grup",

  },
  {
    "name": "Sektör",

  },
  {
    "name": "Reyon",

  },
  {
    "name": "Marka",

  },
  {
    "name": "Model",

  },
];

class Menu {
  String? name;

  Menu({ this.name,});
  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];

  }
}
