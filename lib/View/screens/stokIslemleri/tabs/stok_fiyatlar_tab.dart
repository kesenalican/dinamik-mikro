import 'package:dinamik_otomasyon/View/screens/stokIslemleri/son_satis_fiyatlari.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class FiyatlarTab extends StatefulWidget {
  const FiyatlarTab({Key? key}) : super(key: key);

  @override
  State<FiyatlarTab> createState() => _FiyatlarTabState();
}

class _FiyatlarTabState extends State<FiyatlarTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Column(
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
                      "Tanımlı Fiyatlar",
                      style: TextStyle(
                        color: Color(MyColors.bg01),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
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
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Liste No: 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Satış Fiyatı",
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
                            child: Text("Fiyat: 25.00 Türk Lirası"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("  Adet Fiyatı"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SonSatisFiyatlari(
                      satisMi: true,
                    )));

                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(MyColors.bg01),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Son Satış Fiyatları",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => SonSatisFiyatlari(
                      satisMi: false,
                    )));
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(MyColors.bg01),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Son Alış Fiyatları",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}
