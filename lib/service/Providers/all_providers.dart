import 'package:dinamik_otomasyon/Model/depo_model.dart';
import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

//#region Depo
final depolarProvider = FutureProvider<List<Depo>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Depo");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Depo> cariList = mapData.map((e) => Depo.fromMap(e)).toList();
  return cariList;
});
//#endregion