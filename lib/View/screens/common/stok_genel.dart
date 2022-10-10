import 'package:dinamik_otomasyon/View/screens/common/stok_detay_satir.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:flutter/material.dart';

class StokGenel extends StatefulWidget {
  const StokGenel({Key? key}) : super(key: key);

  @override
  State<StokGenel> createState() => _StokGenelState();
}

class _StokGenelState extends State<StokGenel> {

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: h*0.8,
        width: double.infinity,
        child: ListView(
          children: [
            StokDetaySatir(stokOzellik: "Ürün Kodu", aciklama: "0001"),
            StokDetaySatir(stokOzellik: "Ürün Adı", aciklama: "Dinamik"),
            StokDetaySatir(stokOzellik: "Barkod", aciklama: "dnmk01"),
            StokDetaySatir(stokOzellik: "Bakiye", aciklama: "300"),
            StokDetaySatir(stokOzellik: "Birim", aciklama: "Adet"),
            StokDetaySatir(stokOzellik: "Birim-2", aciklama: "Tane"),
            StokDetaySatir(stokOzellik: "Birim-3", aciklama: "miktar"),
            StokDetaySatir(stokOzellik: "KDV %", aciklama: "18"),
            StokDetaySatir(stokOzellik: "Kategori", aciklama: "otomasyon"),
            StokDetaySatir(stokOzellik: "Ana Grup", aciklama: "satış"),
            StokDetaySatir(stokOzellik: "Alt Grup", aciklama: ""),
            StokDetaySatir(stokOzellik: "Sektör", aciklama: ""),
            StokDetaySatir(stokOzellik: "Reyon", aciklama: "40"),
            StokDetaySatir(stokOzellik: "Marka", aciklama: "Dinamik"),
            StokDetaySatir(stokOzellik: "Model", aciklama: "El Terminali"),

          ],
        ),
      ),
    );
  }
}
