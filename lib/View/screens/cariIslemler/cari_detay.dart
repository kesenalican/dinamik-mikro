import 'package:dinamik_otomasyon/View/screens/cariIslemler/tabs/cari_bakiye.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/tabs/cari_genel.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/tabs/cari_iletisim.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/tabs/cari_islemler.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/tabs/cari_raporlar.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../common/stok_genel.dart';

class CariDetay extends StatelessWidget {
  const CariDetay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Cari Detay",
            style: TextStyle(
                color: Color(MyColors.bg), fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Color(MyColors.bg01), size: 30),
          backgroundColor: Color(MyColors.bg01),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: "Genel",
              ),
              Tab(
                icon: Icon(Icons.price_change_rounded),
                text: "İşlemler",
              ),
              Tab(
                icon: Icon(Icons.currency_exchange),
                text: "Bakiye",
              ),
              Tab(
                icon: Icon(Icons.call),
                text: "İletişim",

              ),
              Tab(
                icon: Icon(Icons.report_gmailerrorred),
                text: "Raporlar",
              ),
              Tab(
                icon: Icon(Icons.auto_graph),
                text: "Grafikler",
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: [
            //Genel Tab
            CariGenelTab(),
            //Icon(Icons.directions_bike),
            //Islemler Tab
            CariIslemlerTab(),
            //Bakiye İslemleri
            CariBakiyeTab(),
            CariIletisimTab(),
            CariRaporlarTab(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
