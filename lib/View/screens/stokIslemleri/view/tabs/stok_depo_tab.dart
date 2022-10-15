import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';

class DepoTab extends StatefulWidget {
  const DepoTab({Key? key}) : super(key: key);

  @override
  State<DepoTab> createState() => _DepoTabState();
}

class _DepoTabState extends BaseState<DepoTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildStokDepoDagilimText(context),
          buildUrunDagilim(),
          //veriyi çekince ayır
          Container(
            width: double.infinity,
            margin: paddingDefault,
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
                      padding: paddingDefault,
                      child: const Text(
                        "No: 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: paddingDefault,
                      child: const Text(
                        "Depo Adı: Merkez depo",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: paddingDefault,
                      child: const Text("Miktar: -461,99"),
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

  Container buildUrunDagilim() {
    return Container(
      width: double.infinity,
      margin: paddingDefault,
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
                padding: paddingDefault,
                child: const Text(
                  "No: -1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: paddingDefault,
                child: const Text(
                  "${Constants.DEPO_ADI}Tüm Depolar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: paddingDefault,
                child: const Text("${Constants.MIKTAR} -461,99"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildStokDepoDagilimText(BuildContext context) {
    return Container(
      margin: paddingTextField,
      padding:paddingDefault,
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
