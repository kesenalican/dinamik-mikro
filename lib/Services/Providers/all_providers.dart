import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

import '../../Model/stoklar_model.dart';

//#region Dio BaseOptions
final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "http://192.168.5.24:5239/api/"));
});
//#endregion

//#region Stoklar Dio.get
// base url'e Stoklar soneki verip temel apime ulaşıyorum.
final stoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
  final _dio = ref.watch(httpClientProvider);
  final _result = await _dio.get("Stoklar");
  List<Map<String, dynamic>> _mapData = List.from(_result.data);
  List<Stoklar> _stoklist = _mapData.map((e) => Stoklar.fromMap(e)).toList();
  return _stoklist;
});

//#endregion
