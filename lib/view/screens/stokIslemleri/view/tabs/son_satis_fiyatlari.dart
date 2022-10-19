import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common_appbar.dart';
import '../../../../styles/colors.dart';

class SonSatisFiyatlari extends ConsumerWidget {
  Stoklar stokModel;

  SonSatisFiyatlari({Key? key, required this.stokModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var alisFiyatlari =
        ref.watch(stokSatisFiyatlariProvider(stokModel.stokKodu));
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Son Satış Fiyatları"),
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
                  "Son Satış Fiyatları",
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
                      var formattedDate =
                          "${dateTime.year}/${dateTime.month}/${dateTime.day}";
                      return Column(
                        children: [
                          fiyatList(
                              sirketAdi: liste[index].cariAdi,
                              brutFiyati: liste[index].brutTutar,
                              fiyati: liste[index].netBirimFiyati,
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
      {String? tarih,
      String? sirketAdi,
      double? fiyati,
      double? brutFiyati,
      double? miktar}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tarih!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  sirketAdi!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
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
                child: Text("Miktar: ${miktar!} "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Brüt Fiyatı: ${brutFiyati!}TL"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Net Fiyat: ${miktar * fiyati!}TL "),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(" Adet Fiyatı"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
