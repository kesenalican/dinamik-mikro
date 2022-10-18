import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_karti.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/base/state/base_state.dart';
import '../../../common/search_input.dart';
import '../../../styles/colors.dart';

class StokListele extends StatefulWidget {
  StokListele({Key? key}) : super(key: key);

  @override
  State<StokListele> createState() => _StokListeleState();
}

class _StokListeleState extends BaseState<StokListele> {
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
            const SearchInput(),
            buildListeleButton(),
            const StokKartlari(),
          ],
        ),
      ),
    );
  }

  Widget buildListeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: dynamicWidth(0.03), vertical: dynamicHeight(0.01)),
        padding: paddingDefault,
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
