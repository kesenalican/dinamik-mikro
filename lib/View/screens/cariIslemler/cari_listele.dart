import 'package:dinamik_otomasyon/Services/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/cari_kartlar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Model/cariler.dart';
import '../../common/common_appbar.dart';
import '../../common/search_input.dart';
import '../../styles/colors.dart';

class CariListele extends ConsumerWidget {
  const CariListele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(whichPage: "Cariler"),
      body: RefreshIndicator(
        onRefresh: ()async{
          ref.read(carilerProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: SearchInput(),
              ),
              //Hepsini Listele Butonu
              listeleButton(),
              const CariKartlar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget listeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        padding: const EdgeInsets.all(10),
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
