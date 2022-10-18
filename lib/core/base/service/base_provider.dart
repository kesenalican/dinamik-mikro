import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final httpClientProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(baseUrl: "http://192.168.5.24:5239/api/"));
});
