import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Cariler
final carilerProvider =
    FutureProvider.family<List<Cariler>, int>((ref, pageCount) async {
  final dio = ref.watch(httpClientProvider);
  final result =
      await dio.get("CariBilgiler", queryParameters: {'offset': pageCount});
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  return cariList;
});
//#endregion