import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Model/stoklar_model.dart';
import '../../../Services/Providers/all_providers.dart';
import '../../common/search_input.dart';
import '../../styles/colors.dart';

class StokListele extends StatefulWidget {
  StokListele({Key? key}) : super(key: key);

  @override
  State<StokListele> createState() => _StokListeleState();
}

class _StokListeleState extends State<StokListele> {
  @override
  Widget build(BuildContext context) {
    List<Stoklar> searchList = [];
    List<Stoklar> _stockList = [];
    void searchFunc(String value) {
      _stockList.forEach((stok) {
        if (stok.stoIsim.contains(value)) {
          searchList.add(stok);
          setState(() {});
        }
      });
    }

    return Scaffold(
      appBar: CommonAppbar(whichPage: "Stok Kartlari"),
      body: SingleChildScrollView(
        child: Column(
          children: [
             const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SearchInput(

              ),
            ),
            listeleButton(),
            const StokKartlari(

            ),
            // StokKartlari2(),
          ],
        ),
      ),
    );
  }

  Widget listeleButton() {
    return GestureDetector(
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
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
