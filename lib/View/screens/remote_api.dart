import 'package:flutter/material.dart';

import '../../Model/banka_model.dart';
import 'package:dio/dio.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {

  Future<List<Bankalar>?> _getBankList() async {
    debugPrint("getbanka girdim!!!");
    try {
      var response = await Dio().get("http://192.168.5.24:5239/api/Department");
      List<Bankalar> _bankList = [];
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        _bankList =
            (response.data as List).map((e) => Bankalar.fromMap(e)).toList();
      }
      return _bankList;
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  late final Future<List<Bankalar>?> _bankList;

  Future<List<Bankalar>?> _getStokAnaGrup() async {
    debugPrint("getbanka girdim!!!");
    try {
      var response = await Dio().get(
          "http://192.168.5.24:5239/api/StokAnaGrup");
      if (response.statusCode == 200) {
        debugPrint("status codeum 200!!!!");
        debugPrint("Bankalar ===" + response.data.toString());

        return [];
      }
      else {
        debugPrint("HATAAA!!!");
      }
    } catch (e) {
      debugPrint("HATA ====" + e.toString());
      return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bankList = _getBankList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bankalar"),
      ),
      body: Center(
        child: FutureBuilder<List<Bankalar>?>(
            future: _bankList,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                var bankList = snapShot.data!;
                return ListView.builder(itemBuilder: (context, index) {
                  var bank = bankList[index];
                  return ListTile(
                    title: Text(bank.banIsmi),
                    subtitle: Text(bank.banKod),
                  );
                }, itemCount: bankList.length,);
              } else if (snapShot.hasError) {
                return Text(snapShot.error.toString());
              }
              else {
                return CircularProgressIndicator();
              }


            }
        ),
      ),
    );
  }
}
