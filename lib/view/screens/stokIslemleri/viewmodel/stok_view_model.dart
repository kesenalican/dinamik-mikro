import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

class StoklarNotifier extends StateNotifier<List<Stoklar>> {
  StoklarNotifier() : super([]);

  Future<List<Stoklar>> getStoklar() async {
    var baseUrl = ConstantProvider.BASE_URL;
    try {
      var response = await Dio().get("${baseUrl}Stoklar");
      if (response.statusCode == 200) {
        debugPrint("GELEN VERİLER === ${response.data.toString()}");
        List<Map<String, dynamic>> mapData = List.from(response.data);
        List<Stoklar> stoklist =
            mapData.map((e) => Stoklar.fromMap(e)).toList();
        return stoklist;
      } else {
        return Future.delayed(const Duration(milliseconds: 2000));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
