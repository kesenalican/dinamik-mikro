import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stok_alis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Stoklar koda göre sıralama
final stoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Stoklar");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
  return stoklist;
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

