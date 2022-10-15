import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';
import '../../../styles/colors.dart';

class CariBakiyeTab extends StatelessWidget {
  const CariBakiyeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(context.dynamicHeight * 0.015),
        padding: EdgeInsets.all(context.dynamicHeight * 0.015),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            buildTeminatRiskBilgileri(),
            // Açık Hesap Bakiyesi
            buildAcikHesapBakiye(context),
            //Müşteri Çeki (Kendisi)
            buildMusteriCeki(context),
            //Faturalaşmamış İrsaliye Bakiyesi
            buildFaturalasmamisIrsaliyeBakiyesi(context),
            //Sipariş Bakiyesi
            buildSiparisBakiyesi(context),
            SizedBox(
              height: context.dynamicHeight * 0.1,
            ),
            //Teminatı
            buildTeminati(context),
          ],
        ),
      ),
    );
  }

  Container buildTeminati(context) {
    return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(MyColors.bg01),
              border: Border.all(color: Color(MyColors.bg)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: context.paddingDefault,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          Constants.TEMINATI,
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "10.000,00",
                          style: whiteTxtStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          Constants.RISK_LIMITI,
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "604.000,00",
                          style: whiteTxtStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          Constants.TOPLAM_RISKI,
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ":",
                          style: whiteTxtStyle,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          "-594.000,00",
                          style: whiteTxtStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Padding buildSiparisBakiyesi(context) {
    return Padding(
            padding: context.paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.SIPARIS_BAKIYESI,
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ":",
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "60.000,00",
                    style: purpleTxtStyle,
                  ),
                ),
              ],
            ),
          );
  }

  Padding buildFaturalasmamisIrsaliyeBakiyesi(context) {
    return Padding(
            padding: context.paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.FATURALASMAMIS_IRSALIYE_BAKIYESI,
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ":",
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "57.541,41",
                    style: purpleTxtStyle,
                  ),
                ),
              ],
            ),
          );
  }

  Padding buildMusteriCeki(context) {
    return Padding(
            padding: context.paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.MUSTERI_CEKI,
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ":",
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "5.000,00",
                    style: purpleTxtStyle,
                  ),
                ),
              ],
            ),
          );
  }

  Padding buildAcikHesapBakiye(context) {
    return Padding(
            padding: context.paddingDefault,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.ACIK_HESAP_BAKIYE,
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ":",
                    style: purpleTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "410.325,00",
                    style: purpleTxtStyle,
                  ),
                ),
              ],
            ),
          );
  }

  Padding buildTeminatRiskBilgileri() {
    return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              Constants.TEMINAT_RISK_BILGILERI,
              style: purpleBoldTxtStyle,
            ),
          );
  }
}
