import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../Model/stok_depo_detay.dart';
import '../../../../Model/stoklar_model.dart';
import '../../../styles/colors.dart';
import 'package:dio/dio.dart';

//RİVERPOD VERİ ÇEKME DENEMESİ
//Dio için temel bir api url'i tanımlıyoruz
final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "http://192.168.5.24:5239/api/"));
});

// base url'e Stoklar soneki verip temel apime ulaşıyorum.
final stoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("Stoklar");
  List<Map<String, dynamic>> _mapData = _result.data;
  List<Stoklar> _stoklist = _mapData.map((e) => Stoklar.fromMap(e)).toList();
  return _stoklist;
});

class StokKartlari extends StatefulWidget {
  const StokKartlari({Key? key}) : super(key: key);

  @override
  State<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends State<StokKartlari> {
  Future<List<StokDepoDetay>?> _getStokDetay() async {
    try {
      var response =
      await Dio().get("http://192.168.5.24:5239/api/StokDepoDetaylari");
      List<StokDepoDetay> _stokList = [];
      if (response.statusCode == 200) {
        _stokList = (response.data as List)
            .map((e) => StokDepoDetay.fromMap(e))
            .toList();
      }
      return _stokList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<List<Stoklar>?> _getStoklar() async {
    try {
      var response = await Dio().get("http://192.168.5.24:5239/api/Stoklar");
      List<Stoklar> _stokList = [];
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        _stokList =
            (response.data as List).map((e) => Stoklar.fromMap(e)).toList();
      }
      return _stokList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  late final Future<List<Stoklar>?> _stokList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _stokList = _getStoklar();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: GestureDetector(
        onTap: () {

        },
        child: SingleChildScrollView(
          child: FutureBuilder<List<Stoklar>?>(
            future: _stokList,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                var stockList = snapShot.data!;
                return SingleChildScrollView(
                  child: Container(
                    height: h * 0.75,
                    width: double.infinity,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var stok = stockList[index];
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        stok.stoIsim,
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
                                        stok.stoKod,
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
                      itemCount: 5,
                    ),
                  ),
                );
              } else if (snapShot.hasError) {
                return Text(snapShot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
