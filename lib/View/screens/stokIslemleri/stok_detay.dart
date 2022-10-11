import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import 'package:dinamik_otomasyon/View/screens/common/stok_genel.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/tabs/stok_depo_tab.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/tabs/stok_fiyatlar_tab.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/tabs/stok_raporlar_tab.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../common/stok_detay_satir.dart';

class StokDetay extends StatefulWidget {
  String? urunKodu;
  String? urunAdi;

   StokDetay({Key? key, required this.urunKodu, required this.urunAdi}) : super(key: key);

  @override
  State<StokDetay> createState() => _StokDetayState();
}

class _StokDetayState extends State<StokDetay> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Stok Detay",
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
                text: "Fiyatlar",
              ),
              Tab(
                icon: Icon(Icons.warehouse),
                text: "Depo",
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
           // StokGenel(),
            // Fiyat Tab
            FiyatlarTab(),
            //Depo Tab
            DepoTab(),
            // RaporlarTab
            RaporlarTab(),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
