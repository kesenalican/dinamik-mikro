import 'package:flutter/material.dart';
import '../../../common/common_appbar.dart';
import '../../../styles/colors.dart';

class SonSatisFiyatlari extends StatefulWidget {
  bool? satisMi;

  SonSatisFiyatlari({Key? key, required this.satisMi}) : super(key: key);

  @override
  State<SonSatisFiyatlari> createState() => _SonSatisFiyatlariState();
}

class _SonSatisFiyatlariState extends State<SonSatisFiyatlari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.satisMi == true
          ? CommonAppbar(whichPage: "Son Satış Fiyatları")
          : CommonAppbar(whichPage: "Son Alış Fiyatları"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(MyColors.bg02),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    widget.satisMi == true
                        ? "Son Satış Fiyatları"
                        : "Son Alış Fiyatları",
                    style: TextStyle(
                      color: Color(MyColors.bg01),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              //Satış fiyatı mı Listelensin, Alış fiyatı mı?
              widget.satisMi == true
                  ? fiyatList(
                      sirketAdi: "ABC TEKSTİL",
                      brutFiyati: 25.00,
                      fiyati: 25.00,
                      miktar: 1,
                      tarih: "10.06.2022",
                    )
                  : fiyatList(
                      sirketAdi: "Alınan Firma",
                      tarih: "01.01.2022",
                      miktar: 1000,
                      fiyati: 15.00,
                      brutFiyati: 15.00,
                    ),
              widget.satisMi == true
                  ? fiyatList(
                      sirketAdi: "Dinamik Mühendislik",
                      brutFiyati: 25.00,
                      fiyati: 25.00,
                      miktar: 4,
                      tarih: "01.04.2022",
                    )
                  : Container(),
              widget.satisMi == true
                  ? fiyatList(
                      sirketAdi: "Gap Gross",
                      brutFiyati: 30.00,
                      fiyati: 30.00,
                      miktar: 5,
                      tarih: "10.06.2022",
                    )
                  : Container(),
              widget.satisMi == true
                  ? fiyatList(
                      sirketAdi: "ORNEK SİRKET LTD. ŞTİ.",
                      brutFiyati: 250.00,
                      fiyati: 250.00,
                      miktar: 10,
                      tarih: "10.06.2022",
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget fiyatList(
      {String? tarih,
      String? sirketAdi,
      double? fiyati,
      double? brutFiyati,
      int? miktar}) {
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
                child: Text(" Brüt Fiyatı: ${brutFiyati!}€"),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Net Fiyat: ${miktar * fiyati!}€ "),
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
