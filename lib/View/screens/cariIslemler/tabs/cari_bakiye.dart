import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class CariBakiyeTab extends StatelessWidget {
  const CariBakiyeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(h*0.015),
        padding: EdgeInsets.all(h*0.015),
        //height: h*0.7,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Teminat / Risk Bilgileri", style: purpleBoldTxtStyle,),
            ),
            // Açık Hesap Bakiyesi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text("Açık Hesap Bakiye",style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(":", style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("410.325,00", style: purpleTxtStyle,),
                  ),

                ],
              ),
            ),
            //Müşteri Çeki (Kendisi)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text("Müşteri Çeki (Kendisi)",style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(":", style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("5.000,00", style: purpleTxtStyle,),
                  ),

                ],
              ),
            ),
            //Faturalaşmamış İrsaliye Bakiyesi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text("Faturalaşmamış İrsaliye Bakiyesi",style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(":", style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("57.541,41", style: purpleTxtStyle,),
                  ),

                ],
              ),
            ),
            //Sipariş Bakiyesi
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 7,
                    child: Text("Sipariş Bakiyesi",style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(":", style: purpleTxtStyle,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text("60.000,00", style: purpleTxtStyle,),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: h*0.1,
            ),
            //Teminatı
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(MyColors.bg01),
                border: Border.all(color: Color(MyColors.bg)),

              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text("Teminatı",style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(":", style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("10.000,00", style: whiteTxtStyle,),
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
                          child: Text("Risk Limiti",style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(":", style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("604.000,00", style: whiteTxtStyle,),
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
                          child: Text("Toplam Riski",style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(":", style: whiteTxtStyle,),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text("-594.000,00", style: whiteTxtStyle,),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
