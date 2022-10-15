import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';

class RaporlarTab extends StatefulWidget {
  const RaporlarTab({Key? key}) : super(key: key);

  @override
  State<RaporlarTab> createState() => _RaporlarTabState();
}

class _RaporlarTabState extends State<RaporlarTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: context.dynamicHeight,
        margin: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth * 0.02,
            vertical: context.dynamicHeight * 0.001),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.STOK_BAKIYE_LISTESI)),
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.STOK_ENVANTER_RAPORU)),
            Expanded(
                flex: 1,
                child: raporListe(
                    raporAdi: Constants.DEPODA_HANGI_URUNLER_MEVCUT)),
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.URUN_HANGI_DEPODA)),
            Expanded(
                flex: 1,
                child:
                    raporListe(raporAdi: Constants.SATISI_YAPILMAYAN_URUNLER)),
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.EN_COK_SATILAN_URUNLER)),
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.EN_COK_ALINAN_URUNLER)),
          ],
        ),
      ),
    );
  }

  Widget raporListe({String? raporAdi}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth * 0.02),
        margin: context.paddingDefault,
        decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(MyColors.bg01))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_graph,
                  color: Color(MyColors.bg01),
                  size: 30,
                ),
                Text(
                  raporAdi!,
                  style: TextStyle(
                    color: Color(MyColors.bg01),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.star_border_purple500_sharp,
                  color: Color(MyColors.bg01),
                  size: 30,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Color(MyColors.bg01),
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
