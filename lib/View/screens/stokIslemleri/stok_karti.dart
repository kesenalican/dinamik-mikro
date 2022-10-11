import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Model/stok_depo_detay.dart';
import '../../../Model/stoklar_model.dart';
import '../../styles/colors.dart';
import 'package:dio/dio.dart';

//RİVERPOD VERİ ÇEKME DENEMESİ
//Dio için temel bir api url'i tanımlıyoruz
final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "http://192.168.5.24:5239/api"));
});

// base url'e Stoklar soneki verip temel apime ulaşıyorum.
final stoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("/Stoklar");
  List<Map<String, dynamic>> _mapData = _result.data;
  List<Stoklar> _stoklist = _mapData.map((e) => Stoklar.fromMap(e)).toList();
  return _stoklist;
});

class StokKartlari extends ConsumerWidget {
  const StokKartlari({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _liste = ref.watch(stoklarProvider);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StokDetay(
                        urunKodu: "bekle",
                        urunAdi: "bekle",
                      )));
        },
        child: SingleChildScrollView(
          child: Container(
            height: h * 0.75,
            width: double.infinity,
            child: _liste.when(data: (liste){
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
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
                              width: w * 0.01,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  liste[index].stoKod,
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Text(
                                  liste[index].stoIsim,
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: w * 0.10,
                            ),
                            //FİYAT
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Adet: 5",
                                    style: TextStyle(
                                      color: Color(MyColors.bg01),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Fiyat: 123",
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 20,
              );
            }, error: (err, stack){
              return Center(child: Text("Hata çıktı ${err.toString()}"),);
            }, loading:() =>const Center(child: CircularProgressIndicator(),)),
          ),
        ),
      ),
    );
  }
}

