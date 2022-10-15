import 'package:dinamik_otomasyon/View/screens/common/detay_satir.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Model/stoklar_model.dart';
import '../../../Services/Providers/all_providers.dart';
import '../../../constants/constant.dart';

class StokGenel extends ConsumerWidget {
  final Stoklar stokModel;

  StokGenel({
    Key? key,
    required this.stokModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.dynamicHeight * 0.8,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetaySatir(
                hangiOzellik: Constants.URUN_KODU,
                urunBilgi: stokModel.stokKodu),
            DetaySatir(
                hangiOzellik: Constants.URUN_ADI,
                urunBilgi: stokModel.stokIsim),
            // DetaySatir(hangiOzellik: "Barkod", urunBilgi: "barkod"),
            DetaySatir(hangiOzellik: Constants.BAKIYE, urunBilgi: "bakiye"),
            DetaySatir(
                hangiOzellik: Constants.BIRIM,
                urunBilgi: stokModel.stokBirim1 +
                    "(1 ${stokModel.stokBirim1}) : ${stokModel.stokBirim3Katsayi.toInt()} adet"),
            DetaySatir(hangiOzellik: Constants.BIRIM_2, urunBilgi: "birim-2"),
            DetaySatir(
                hangiOzellik: Constants.BIRIM_3,
                urunBilgi: stokModel.stokBirim3),
            DetaySatir(hangiOzellik: Constants.KDV, urunBilgi: "%18"),
            DetaySatir(hangiOzellik: Constants.KATEGORI, urunBilgi: "kategori"),
            DetaySatir(
                hangiOzellik: Constants.ANA_GRUP,
                urunBilgi: stokModel.stokAnaGrup),
            DetaySatir(
              hangiOzellik: Constants.ALT_GRUP,
              urunBilgi: "alt grup",
            ),
            DetaySatir(
                hangiOzellik: Constants.SEKTOR,
                urunBilgi: stokModel.stokSektor),
            DetaySatir(
                hangiOzellik: Constants.REYON, urunBilgi: stokModel.stokReyon),
            DetaySatir(
                hangiOzellik: Constants.MARKA, urunBilgi: stokModel.stokMarka),
            DetaySatir(
                hangiOzellik: Constants.MODEL, urunBilgi: stokModel.stokModel),
          ],
        ),
      ),
    );
  }
}
