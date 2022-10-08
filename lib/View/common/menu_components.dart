import 'package:flutter/material.dart';

List dataList = [
  {
    "name": "Fatura İşlemleri",
    "icon": Icons.payment,
    "subMenu": [
      {"name":"Alış Faturası",},
      {"name":"Satış Faturaları",},
      {"name":"Bekleyen Faturalar",},
      {"name":"Transfer Edilmeyenler",},
      {"name":"Transfer Edilenler",},
    ]
  },
  {
    "name": "İrsaliye İşlemleri",
    "icon": Icons.payment,
    "subMenu": [
      {"name":"Alış İrsaliyesi",},
      {"name":"Satış İrsaliyesi",},
      {"name":"Bekleyen İrsaliyeler",},
      {"name":"Transfer Edilmeyenler",},
      {"name":"Transfer Edilenler",},
    ]
  },
  {
    "name": "Sipariş İşlemleri",
    "icon": Icons.reorder,
    "subMenu": [
      {"name":"Satış Siparişi",},
      {"name":"Alım Siparişi",},
      {"name":"Sipariş Onaylama",},
      {"name":"Bekleyen Siparişler",},
      {"name":"Sipariş Takibi",},
      {"name":"Transfer Edilenler",},
      {"name":"Transfer Edilmeyenler",},
    ]
  },
  {
    "name": "Sipariş Teslimatı",
    "icon": Icons.delivery_dining,
    "subMenu": [
      {"name":"Sipariş Teslimatı",},
      {"name":"Beklemeye Alınanlar",},
      {"name":"Transfer Edilmeyenler",},
    ]
  },
  {
    "name": "Ziyaret İşlemleri",
    "icon": Icons.visibility_outlined,
    "subMenu": [
      {"name":"Mevcut Cari Hesap",},
      {"name":"Yeni Cari Hesap",},
      {"name":"Transfer Edilenler",},
      {"name":"Transfer Edilmeyenler",},
    ]
  },
  {
    "name": "Finans İşlemleri",
    "icon": Icons.attach_money_outlined,
    "subMenu": [
      {"name":"Tahsilat",},
      {"name":"Ödeme",},
      {"name":"Transfer Edilenler",},
      {"name":"Transfer Edilmeyenler",},
    ]
  },
  {
    "name": "Cari İşlemler",
    "icon": Icons.account_circle,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Stok İşlemleri",
    "icon": Icons.production_quantity_limits,
    "subMenu": [
      {"name":"Stok Kart Detay",},
      {"name":"Barkod Ekle",},
      {"name":"Sayım Fişi",},
      {"name":"Depo Fişi",},
      {"name":"Transfer Edilmeyen Fişler",},
      {"name":"Fiş Listesi",},
    ]
  },
  {
    "name": "Raporlar",
    "icon": Icons.report,
    "subMenu": [
      {"name":"Cari Raporları",},
      {"name":"Stok Raporları",},
      {"name":"Sipariş Raporları",},
      {"name":"Fatura Raporları",},
      {"name":"İrsaliye Raporları",},
      {"name":"Gün Sonu",},
      {"name":"Diğer",},
      {"name":"Rapor Yedekle/İndir",},
    ]
  },
  {
    "name": "Döviz Kurları",
    "icon": Icons.money,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Şirket Değiştir",
    "icon": Icons.change_circle,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Veri Güncelleme",
    "icon": Icons.update,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Sunucu Ayarları",
    "icon": Icons.settings,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Ayarlar",
    "icon": Icons.settings,
    "tekmenu":[
      {"name":"1",},
    ]
  },
  {
    "name": "Çıkış",
    "icon": Icons.exit_to_app,
    "tekmenu":[
      {"name":"1",},
  ]
  },



];

class Menu {
  String? name;
  IconData? icon;
  List<Menu>? tekmenu = [];
  List<Menu>? subMenu = [];

  Menu({ this.name,  this.subMenu, this.icon, this.tekmenu});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(new Menu.fromJson(v));
      });

    }
  }
}
