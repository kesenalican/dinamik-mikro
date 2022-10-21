import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../../../styles/colors.dart';

class StokKartlari extends HookConsumerWidget {
  const StokKartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> handleRefresh() async {
      return await Future.delayed(
        const Duration(seconds: 2),
        () {
          return ref.read(stoklarProvider);
        },
      );
    }

    var liste = ref.watch(stoklarProvider);
    return Padding(
      padding: EdgeInsets.all(context.dynamicHeight * 0.001),
      child: SingleChildScrollView(
        child: LiquidPullToRefresh(
          onRefresh: handleRefresh,
          color: Color(
            MyColors.bg01,
          ),
          height: context.dynamicHeight * 0.1,
          animSpeedFactor: 2,
          child: SizedBox(
            height: context.dynamicHeight * 0.75,
            width: double.infinity,
            child: liste.when(
              data: (data) {
                List liste = data.map((e) => e).toList();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StokDetay(
                                      stokModel: liste[index],
                                    )));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Card(
                          elevation: 4,
                          color: Color(MyColors.bg),
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding:
                                EdgeInsets.all(context.dynamicHeight * 0.01),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Color(MyColors.bg01),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth * 0.01,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        liste[index].stokIsim,
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: context.dynamicHeight * 0.01,
                                      ),
                                      Text(
                                        liste[index].stokKodu,
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: context.dynamicWidth * 0.10,
                                ),
                                //FİYAT
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            context.dynamicHeight * 0.006),
                                        child: Text(
                                          "Adet: ${liste[index].stokFiyat.ceil().toString()}",
                                          style: TextStyle(
                                            color: Color(MyColors.bg01),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "${liste[index].stokFiyat.toString()} TL",
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontSize: 10,
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
                  },
                  itemCount: liste.length,
                );
              },
              error: (err, stack) {
                return Center(
                  child: Text("Hata çıktı ${err.toString()}"),
                );
              },
              loading: () => Center(
                child: CircularProgressIndicator(
                  color: Color(MyColors.bg01),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
