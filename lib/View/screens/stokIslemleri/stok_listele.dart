import 'package:dinamik_otomasyon/View/common/custom_appbar.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';

import '../../common/search_input.dart';

class StokListele extends StatefulWidget {
  const StokListele({Key? key}) : super(key: key);

  @override
  State<StokListele> createState() => _StokListeleState();
}

class _StokListeleState extends State<StokListele> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Stok Listele"),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SearchInput(),
            ),
            StokKartlari(),
          ],
        ),
      ),
    );
  }
}
