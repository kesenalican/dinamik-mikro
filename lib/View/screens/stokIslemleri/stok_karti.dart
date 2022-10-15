import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Model/stoklar_model.dart';
import '../../../Services/Providers/all_providers.dart';
import '../../styles/colors.dart';

class StokKartlari extends ConsumerWidget {
  const StokKartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste = ref.watch(stoklarProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: SingleChildScrollView(
        child: Container(
          height: context.dynamicHeight * 0.75,
          width: double.infinity,
          child: _liste.when(
            data: (data) {
              List<Stoklar> liste = data.map((e) => e).toList();
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
                          padding: EdgeInsets.all(10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        fontSize: 8,
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Adet: 5",
                                        style: TextStyle(
                                          color: Color(MyColors.bg01),
                                          fontSize: 8,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Text(
                                        liste[index].stokFiyat.toString()+" TL",
                                      style: TextStyle(
                                        color: Color(MyColors.bg01),
                                        fontSize: 8,
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
                itemCount: 20,
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
      ),
    );
  }
}

