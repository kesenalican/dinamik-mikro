import 'package:dinamik_otomasyon/service/Providers/api_status.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class StokViewModel extends ChangeNotifier {
//   bool _loading = false;
//   List<Stoklar> _stokListModel = [];

//   bool get loading => _loading;
//   List<Stoklar> get stokListModel => _stokListModel;

//   setLoading(bool loading) async {
//     _loading = loading;
//     notifyListeners();
//   }

//   setStokListModel(List<Stoklar> stokModel) {
//     _stokListModel = stokModel;
//   }

//   getStoklar() async {
//     setLoading(true);
//     var response = await StokService.getStok();
//     if (response is Success) {
//       setStokListModel(response.response as List<Stoklar>);
//     }
//     if (response is Failure) {
//       setStokListModel(response.errorResponse as List<Stoklar>);
//     }
//     setLoading(false);
//   }
// }

//-----------------------------------------------------------------

class StokViewModel extends StateNotifier<List<Stoklar>> {
  StokViewModel(super.state);

  bool _loading = false;
  List<Stoklar> _stokListModel = [];
  bool get loading => _loading;

  setLoading(bool loading) async {
    _loading = loading;
  }

  setStokListModel(List<Stoklar> stoklar) {
    _stokListModel = stoklar;
  }

  getStoklar() async {
    final apiResult = await StokService.getStok();
    return apiResult;
  }
}
