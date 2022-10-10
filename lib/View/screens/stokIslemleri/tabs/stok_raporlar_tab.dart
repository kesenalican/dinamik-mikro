import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:flutter/material.dart';

class RaporlarTab extends StatefulWidget {
  const RaporlarTab({Key? key}) : super(key: key);

  @override
  State<RaporlarTab> createState() => _RaporlarTabState();
}

class _RaporlarTabState extends State<RaporlarTab> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            raporListe(raporAdi: "Stok Bakiye Listesi"),
            raporListe(raporAdi: "Stok Envanter Raporu"),
            raporListe(raporAdi: "Depoda Hangi Ürünler Mevcut"),
            raporListe(raporAdi: "Ürün Hangi Depoda"),
            raporListe(raporAdi: "Satışı Yapılmayan Ürünler"),
            raporListe(raporAdi: "En Çok Satılan Ürünler"),
            raporListe(raporAdi: "En Çok Alınan Ürünler"),
          ],
        ),
      ),
    );
  }

  Widget raporListe({String? raporAdi}) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(top:15),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(MyColors.bg03),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(MyColors.bg01))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.auto_graph,color: Color(MyColors.bg01), size: 40,),
                  ),
                  Text(raporAdi!, style: TextStyle(
                    color: Color(MyColors.bg01),
                    fontSize: 15,
                  ),),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Icon(Icons.star_border_purple500_sharp, color: Color(MyColors.bg01),size: 30,),
                  Icon(Icons.navigate_next, color: Color(MyColors.bg01),size: 30,),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
