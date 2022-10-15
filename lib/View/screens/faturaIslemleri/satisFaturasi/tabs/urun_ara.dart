import 'package:dinamik_otomasyon/View/common/search_input.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../common/common_button.dart';
import '../../../../styles/colors.dart';

class UrunAra extends StatefulWidget {
  const UrunAra({Key? key}) : super(key: key);

  @override
  State<UrunAra> createState() => _UrunAraState();
}

class _UrunAraState extends State<UrunAra> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    return SingleChildScrollView(
      child: Column(
        children: [
          //ÜRÜN FİLTRELEME KISMI
          Container(
            margin: context.paddingDefault,
            child: Column(
              children: [
                //STOK KARTI / HİZMET KARTI
                ToggleButtons(
                  fillColor: Color(MyColors.bg01),
                  onPressed: (int newIndex) {
                    setState(() {
                      for(int index=0; index < isSelected.length; index++){
                        if(index==newIndex){
                          isSelected[index]=true;
                        }else{
                          isSelected[index] = false;
                        }
                      }
                    });
                  },
                  color: Color(MyColors.bg01),
                  selectedColor: Colors.white,
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(10),
                  children: const [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Stok Kartı"),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Hizmet Kartı"),
                    ),
                  ],
                ),

                SearchInput(),
                CommonButton(
                  buttonName: "Ürün Ara",
                ),
              ],
            ),
          ),
          //ÜRÜN ARAMA KISMI
        ],
      ),
    );
  }
}
