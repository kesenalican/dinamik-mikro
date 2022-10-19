import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class SonAlisFiyatlari extends ConsumerWidget {
  Stoklar stokModel;
  SonAlisFiyatlari({Key? key, required this.stokModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var alisFiyatlari =
        ref.watch(stokAlisFiyatlariProvider(stokModel.stokKodu));
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Son Alış Fiyatları"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: context.paddingDefault,
              padding: context.paddingDefault,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(MyColors.bg02),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Son Alış Fiyatları",
                  style: TextStyle(
                    color: Color(MyColors.bg01),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.dynamicHeight * 0.80,
              width: double.infinity,
              child: alisFiyatlari.when(
                data: (data) {
                  List liste = data.map((e) => e).toList();
                  return ListView.builder(
                    itemCount: liste.length,
                    itemBuilder: (context, index) {
                      DateTime dateTime = DateTime.parse(liste[index].tarih);
                      double brutFiyat = double.parse(
                          (liste[index].brutTutar).toStringAsFixed(2));
                      double netFiyat = double.parse(
                          (liste[index].netBirimFiyati).toStringAsFixed(2));
                      var formattedDate =
                          "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                      return Column(
                        children: [
                          fiyatList(
                              context: context,
                              sirketAdi: liste[index].cariAdi,
                              brutFiyati: brutFiyat,
                              fiyati: netFiyat,
                              miktar: liste[index].miktar,
                              tarih: formattedDate),
                        ],
                      );
                    },
                  );
                },
                error: (err, stack) {
                  return Center(
                    child: Text("Hata çıktı ${err.toString()}"),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fiyatList(
      {context,
      String? tarih,
      String? sirketAdi,
      double? fiyati,
      double? brutFiyati,
      double? miktar}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sirketAdi!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    tarih!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Miktar: ${(miktar! * -1).ceil()} "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Brüt Fiyatı: ${brutFiyati!} TL"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Net Fiyat: ${miktar * fiyati!} TL "),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
