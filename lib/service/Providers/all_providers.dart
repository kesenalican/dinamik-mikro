import 'package:dinamik_otomasyon/Model/depo_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

//#region Dio BaseOptions
final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "http://192.168.5.24:5239/api/"));
});
//#endregion

//#region Stoklar koda göre sıralama
final stoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("Stoklar");
  List<Map<String, dynamic>> _mapData = List.from(_result.data);
  List<Stoklar> _stoklist = _mapData.map((e) => Stoklar.fromMap(e)).toList();
  return _stoklist;
});
//#endregion

//#region Cariler
final carilerProvider = FutureProvider<List<Cariler>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("CariBilgiler");
  List<Map<String, dynamic>> _mapData = List.from(_result.data);
  List<Cariler> _cariList = _mapData.map((e) => Cariler.fromMap(e)).toList();
  return _cariList;
});
//#endregion

//#region Cariler
final depolarProvider = FutureProvider<List<Depo>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("Depo");
  List<Map<String, dynamic>> _mapData = List.from(_result.data);
  List<Depo> _cariList = _mapData.map((e) => Depo.fromMap(e)).toList();
  return _cariList;
});
//#endregion