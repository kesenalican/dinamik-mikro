import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_depo_tab.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_fiyatlar_tab.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/tabs/stok_raporlar_tab.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constant.dart';
import '../../../styles/colors.dart';
import 'stok_genel.dart';

class StokDetay extends StatefulWidget {
  final Stoklar stokModel;

  StokDetay({Key? key, required this.stokModel}) : super(key: key);

  @override
  State<StokDetay> createState() => _StokDetayState();
}

class _StokDetayState extends State<StokDetay> {
  @override
  Widget build(BuildContext context) {
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
            Constants.STOK_DETAY,
            style: TextStyle(
                color: Color(MyColors.bg), fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Color(MyColors.bg01)),
          backgroundColor: Color(MyColors.bg01),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: Constants.GENEL,
              ),
              Tab(
                icon: Icon(Icons.price_change_rounded),
                text: Constants.FIYATLAR,
              ),
              Tab(
                icon: Icon(Icons.warehouse),
                text: Constants.DEPO,
              ),
              Tab(
                icon: Icon(Icons.report_gmailerrorred),
                text: Constants.RAPORLAR,
              ),
              Tab(
                icon: Icon(Icons.auto_graph),
                text: Constants.RAPORLAR,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Genel Tab
            StokGenel(
              stokModel: widget.stokModel,
            ),
            // Fiyat Tab
            FiyatlarTab(
              stokModel: widget.stokModel,
            ),
            //Depo Tab
            const DepoTab(),
            // RaporlarTab
            const RaporlarTab(),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}