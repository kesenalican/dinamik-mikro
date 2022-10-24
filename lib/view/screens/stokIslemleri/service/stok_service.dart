import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/service/Providers/api_status.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/en_cok_satilan_urunler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stok_alis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/reports/en_cok_satilan_urunler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/viewmodel/stok_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StokService {
  static Future<Object> getStok() async {
    final stoklarProvider =
        StateNotifierProvider.family<List<Stoklar>, Map<String, int>>(
            (ref, map) async {
      final dio = ref.watch(httpClientProvider);
      final result = await dio.get("Stoklar", queryParameters: map);
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
      return stoklist;
    });
    return stoklarProvider;
  }
}

// final stoklarStateProvider =
//     StateNotifierProvider<StoklarNotifier, List<Stoklar>>((ref) {
//   return StoklarNotifier();
// });

//#region Stoklar koda göre sıralama
final stoklarProvider = FutureProvider.autoDispose
    .family<List<Stoklar>, Map<String, int>>((ref, map) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Stoklar", queryParameters: map);
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
    return stoklist;
  } else {
    return Future.delayed(const Duration(seconds: 1));
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final stokAlisFiyatlariProvider =
    FutureProvider.family<List<StokAlisFiyatlari>, String>(
        (ref, stokKodu) async {
  final dio = ref.watch(httpClientProvider);
  final result =
      await dio.post("StokAlisFiyatlari", data: {'stokKodu': stokKodu});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<StokAlisFiyatlari> stokAlisFiyatlari =
        mapData.map((e) => StokAlisFiyatlari.fromMap(e)).toList();
    return stokAlisFiyatlari;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final stokSatisFiyatlariProvider =
    FutureProvider.family<List<StokAlisFiyatlari>, String>(
        (ref, stokKodu) async {
  final dio = ref.watch(httpClientProvider);
  final result =
      await dio.post("StokSatisFiyatlari", data: {'stokKodu': stokKodu});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<StokAlisFiyatlari> stokAlisFiyatlari =
        mapData.map((e) => StokAlisFiyatlari.fromMap(e)).toList();
    return stokAlisFiyatlari;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final enCokSatilanUrunlerProvider =
    FutureProvider.family<List<EnCokSatilanUrunlerModel>, String>(
        (ref, baslangicTarihi) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio
      .post("EnCokSatilanUrunler", data: {'baslangic': baslangicTarihi});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<EnCokSatilanUrunlerModel> enCokSatilanUrunler =
        mapData.map((e) => EnCokSatilanUrunlerModel.fromMap(e)).toList();
    return enCokSatilanUrunler;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//Constructor'a index göndermemek için listview'ın ilk child'ı olarak
//ProviderScope kullanıp stok indeximi diğer sayfada kolayca çağıracağım.

/// OLMADI!
final currentStokIndex = StateProvider<int>((ref) => 0);
