import 'package:dinamik_otomasyon/Services/Providers/all_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../styles/colors.dart';

class CariGenelTab extends ConsumerWidget {
  const CariGenelTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _cariListe= ref.watch(carilerProvider);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Container(
        height: h * 0.8,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(MyColors.bg02),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(MyColors.bg01),
                  ),
                ),
                child: _cariListe.when(
                  data: (liste) {
                    return Container(
                      height: h * 0.9,
                      child: ListView.builder(
                        itemCount: 100,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                const Expanded(flex: 2, child: Text("Cari Kodu")),
                                const Expanded(flex: 1, child: Text(":")),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    liste[index].cariKodu,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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
            )
          ],
        ),
      ),
    );
  }
}
