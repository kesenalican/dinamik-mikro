import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';

import '../model/stoklar_model.dart';

final stokProvider = Provider<StokService>((ref) => StokService());

final stokDataProvider2 =
    FutureProvider.family<List<Stoklar>, int>((ref, offset) async {
  return ref.watch(stokProvider).getUserListforSearch(offset);
});

class StokViewModel extends StateNotifier<List<Stoklar>> {
  StokViewModel(super.state, this._stokService);
  final StokService _stokService;
  Future<List<Stoklar>> getStoklar(int offset) async {
    var userList = await _stokService.getUserListforSearch(offset);
    return userList;
  }
}
