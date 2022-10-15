import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import '../../../Model/stoklar_model.dart';
import '../../../constants/constant.dart';
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
        if (stok.stokIsim.contains(value)) {
          searchList.add(stok);
          setState(() {});
        }
      });
    }
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.STOK_KARTLARI),
      body: SingleChildScrollView(
        child: Column(
          children: [
              Padding(
              padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth*0.04),
              child: const SearchInput(),
            ),
            listeleButton(),
            const StokKartlari(),
          ],
        ),
      ),
    );
  }

  Widget listeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: context.paddingTextField,
        padding: context.paddingDefault,
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
            Constants.HEPSINI_LISTELE,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
