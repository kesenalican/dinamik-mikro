import 'package:dinamik_otomasyon/Services/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/View/screens/common/detay_satir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Model/cariler.dart';
import '../../../styles/colors.dart';

class CariGenelTab extends ConsumerWidget {
  Cariler cariList;

  CariGenelTab({Key? key, required this.cariList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          DetaySatir(hangiOzellik: "Cari Kodu", urunBilgi: cariList.cariKodu),
          DetaySatir(
              hangiOzellik: "Cari Ünvanı", urunBilgi: cariList.cariUnvani1),
          DetaySatir(
              hangiOzellik: "Vergi Daire", urunBilgi: cariList.cariVDaireAdi),
          DetaySatir(
              hangiOzellik: "Vergi/TCK No", urunBilgi: cariList.cariVDaireNo),
          DetaySatir(
              hangiOzellik: "Bakiye",
              urunBilgi:cariList.cariBakiye == 0 ?  cariList.cariBakiye.ceil().toString(): cariList.cariBakiye.toString()+ " TL"),
          DetaySatir(hangiOzellik: "E-Fatura", urunBilgi: "cariList.efatura"),
          DetaySatir(hangiOzellik: "Temsilci", urunBilgi: "cariList.temsilci"),
          DetaySatir(hangiOzellik: "Grup", urunBilgi: "cariList.grup"),
          DetaySatir(hangiOzellik: "Sektör", urunBilgi: "cariList.sektor"),
          DetaySatir(hangiOzellik: "Bölge", urunBilgi: "cariList.bolge"),
          DetaySatir(hangiOzellik: "E-Mail", urunBilgi: cariList.cariEmail),
        ],
      ),
    );
  }
}
