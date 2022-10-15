import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';

class CariListele extends StatefulWidget {
  const CariListele({Key? key}) : super(key: key);

  @override
  State<CariListele> createState() => _CariListeleState();
}

class _CariListeleState extends BaseState<CariListele> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(whichPage: Constants.CARILER),
      body: RefreshIndicator(
        onRefresh: ()async{
          //ref.read(carilerProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
               const SearchInput(),
              buildListeleButton(),
              const CariKartlar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin:EdgeInsets.symmetric(horizontal:dynamicWidth(0.03),vertical: dynamicHeight(0.01)),
        padding:paddingDefault,
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
