import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../styles/colors.dart';
import 'cari_detay.dart';

class CariKartlar extends HookConsumerWidget {
  const CariKartlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> _handleRefresh() async {
      return await Future.delayed(Duration(seconds: 2));
    }

    var cariListe = ref.watch(carilerProvider);
    return Padding(
      padding: context.paddingDefault,
      child: SingleChildScrollView(
        child: LiquidPullToRefresh(
          onRefresh: _handleRefresh,
          color: Color(
            MyColors.bg01,
          ),
          height: context.dynamicHeight * 0.1,
          animSpeedFactor: 2,
          child: SizedBox(
            height: context.dynamicHeight * 0.75,
            width: double.infinity,
            child: cariListe.when(
              data: (data) {
                return ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      List cariListe = data.map((e) => e).toList();
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CariDetay(
                                cariList: cariListe[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: context.paddingDefault,
                          child: Card(
                            elevation: 4,
                            color: Color(MyColors.bg),
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: context.paddingDefault,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(MyColors.bg01),
                                  ),
                                  SizedBox(
                                    width: context.dynamicWidth * 0.03,
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cariListe[index].cariUnvani1,
                                          style: TextStyle(
                                            color: Color(MyColors.bg01),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        SizedBox(
                                          height: context.dynamicHeight * 0.01,
                                        ),
                                        Text(
                                          cariListe[index].cariKodu,
                                          style: TextStyle(
                                            color: Color(MyColors.bg01),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
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
        ),
      ),
    );
  }
}
