import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../constants/constant.dart';
import '../../../styles/colors.dart';

class DepoTab extends StatefulWidget {
  const DepoTab({Key? key}) : super(key: key);

  @override
  State<DepoTab> createState() => _DepoTabState();
}

class _DepoTabState extends State<DepoTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildStokDepoDagilimText(context),
          buildUrunDagilim(context),
          //veriyi çekince ayır
          Container(
            width: double.infinity,
            margin: context.paddingDefault,
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
                  children: [
                    Padding(
                      padding: context.paddingDefault,
                      child: Text(
                        "No: 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Depo Adı: Merkez depo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Miktar: -461,99"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildUrunDagilim(BuildContext context) {
    return Container(
          width: double.infinity,
          margin: context.paddingDefault,
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
                children:  [
                  Padding(
                    padding: context.paddingDefault,
                    child:const  Text(
                      "No: -1",
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  context.paddingDefault,
                    child:const  Text(
                      "${Constants.DEPO_ADI}Tüm Depolar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children:  [
                  Padding(
                    padding: context.paddingDefault,
                    child:const Text("${Constants.MIKTAR} -461,99"),
                  ),
                ],
              ),
            ],
          ),
        );
  }

  Container buildStokDepoDagilimText(BuildContext context) {
    return Container(
          margin:context.paddingTextField,
          padding: context.paddingDefault,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(MyColors.bg02),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              Constants.STOK_DEPO_DAGILIMLARI,
              style: TextStyle(
                color: Color(MyColors.bg01),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        );
  }
}
