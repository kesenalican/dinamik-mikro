import 'package:dinamik_otomasyon/View/screens/common/stok_detay_satir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services/Providers/all_providers.dart';

class StokGenel extends ConsumerWidget {

  const StokGenel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste = ref.watch(stoklarProvider);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: h*0.8,
        width: double.infinity,
        child: ListView(
          children: [
            StokDetaySatir(hangiOzellik: "Ürün Kodu"),
            StokDetaySatir(hangiOzellik: "Ürün Adı"),
            StokDetaySatir(hangiOzellik: "Barkod"),
            StokDetaySatir(hangiOzellik: "Bakiye"),
            StokDetaySatir(hangiOzellik: "Birim"),
            StokDetaySatir(hangiOzellik: "Birim-2"),
            StokDetaySatir(hangiOzellik: "Birim-3"),
            StokDetaySatir(hangiOzellik: "KDV %"),
            StokDetaySatir(hangiOzellik: "Kategori"),
            StokDetaySatir(hangiOzellik: "Ana Grup"),
            StokDetaySatir(hangiOzellik: "Alt Grup"),
            StokDetaySatir(hangiOzellik: "Sektör"),
            StokDetaySatir(hangiOzellik: "Reyon"),
            StokDetaySatir(hangiOzellik: "Marka"),
            StokDetaySatir(hangiOzellik: "Model"),

          ],
        ),
      ),
    );
  }
}
