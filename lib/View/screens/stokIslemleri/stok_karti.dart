import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class StokKartlari extends StatefulWidget {

   const StokKartlari({Key? key}) : super(key: key);

  @override
  State<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends State<StokKartlari> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top:10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => StokDetay()));
        },
        child: Card(
          elevation: 4,
          color: Color(MyColors.bg),
          margin: EdgeInsets.zero,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Color(MyColors.bg01),
                ),
                SizedBox(
                  width: w * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ürün1",
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Text(
                      "Ürün Kodu",
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: w * 0.30,
                ),
                //FİYAT
                Column(
                  children: [
                    Text(
                      "Adet: 100",
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Fiyat: 150TL",
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
