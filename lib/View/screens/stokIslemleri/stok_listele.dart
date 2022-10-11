import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import '../../../Model/stok_depo_detay.dart';
import '../../common/search_input.dart';
import '../../styles/colors.dart';
import 'package:dio/dio.dart';

class StokListele extends StatefulWidget {
  const StokListele({Key? key}) : super(key: key);

  @override
  State<StokListele> createState() => _StokListeleState();
}

class _StokListeleState extends State<StokListele> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Stok Kart Detay"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SearchInput(),
            ),
            //Hepsini Listele Butonu
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(MyColors.bg01),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(MyColors.bg01),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Hepsini Listele",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const StokKartlari(),
            // StokKartlari2(),
          ],
        ),
      ),
    );
  }
}
