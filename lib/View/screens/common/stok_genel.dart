import 'package:dinamik_otomasyon/View/screens/common/detay_satir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Model/stoklar_model.dart';
import '../../../Services/Providers/all_providers.dart';



class StokGenel extends ConsumerWidget {
  final Stoklar stokModel;
  StokGenel({Key? key, required this.stokModel,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.8,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetaySatir(
                hangiOzellik: "Ürün Kodu", urunBilgi:stokModel.stokKodu),
            DetaySatir(
                hangiOzellik: "Ürün Adı", urunBilgi: stokModel.stokIsim),
           // DetaySatir(hangiOzellik: "Barkod", urunBilgi: "barkod"),
            DetaySatir(hangiOzellik: "Bakiye", urunBilgi: "bakiye"),
            DetaySatir(hangiOzellik: "Birim", urunBilgi: stokModel.stokBirim1+"(1 ${stokModel.stokBirim1}) : ${stokModel.stokBirim3Katsayi.toInt()} adet"),
            DetaySatir(hangiOzellik: "Birim-2", urunBilgi: "birim-2"),
            DetaySatir(hangiOzellik: "Birim-3", urunBilgi: stokModel.stokBirim3),
            DetaySatir(hangiOzellik: "KDV %", urunBilgi: "%18"),
            DetaySatir(hangiOzellik: "Kategori", urunBilgi: "kategori"),
            DetaySatir(hangiOzellik: "Ana Grup", urunBilgi: stokModel.stokAnaGrup),
            DetaySatir(
              hangiOzellik: "Alt Grup",
              urunBilgi: "alt grup",
            ),
            DetaySatir(hangiOzellik: "Sektör", urunBilgi: stokModel.stokSektor),
            DetaySatir(hangiOzellik: "Reyon", urunBilgi: stokModel.stokReyon),
            DetaySatir(hangiOzellik: "Marka", urunBilgi: stokModel.stokMarka),
            DetaySatir(hangiOzellik: "Model", urunBilgi: stokModel.stokModel),
          ],
        ),
      ),
    );
  }
}
