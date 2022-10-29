import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/stoklar_model.dart';

class StokViewModel {
  late final StokService _stokService;
  Future<List<Stoklar>> getStoklar(String query) async {
    var userList = await _stokService.getUserListforSearch(query);
    return userList;
  }
}
