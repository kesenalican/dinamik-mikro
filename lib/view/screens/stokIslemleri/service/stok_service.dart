import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int currentPage = 1;
//#region Stoklar koda göre sıralama
final stoklarProvider =
    FutureProvider<List<Stoklar>>((ref, {bool isRefresh = false}) async {
  if (isRefresh) {
    currentPage = 1;
  }

  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Stoklar");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
  return stoklist;
});
//#endregion
