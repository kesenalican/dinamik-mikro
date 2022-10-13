import 'package:dinamik_otomasyon/View/common/search_input.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_button.dart';
import '../../../../styles/colors.dart';

class UrunAra extends StatelessWidget {
  const UrunAra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          //ÜRÜN FİLTRELEME KISMI
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                //STOK KARTI / HİZMET KARTI
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,),
                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(MyColors.bg),
                    border: Border.all(
                        color: Color(
                          MyColors.bg01,
                        ),
                        width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(MyColors.bg01),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child:  Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Stok Kartı",style: purpleTxtStyle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text("Hizmet Kartı",style: purpleTxtStyle,),
                        ),
                      ),
                    ],
                  ),
                ),

                SearchInput(),
                CommonButton(
                  buttonName: "Ürün Ara",
                ),
              ],
            ),
          ),
          //ÜRÜN ARAMA KISMI
          SingleChildScrollView(
            child: Column(
              children: [
                StokKartlari(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
