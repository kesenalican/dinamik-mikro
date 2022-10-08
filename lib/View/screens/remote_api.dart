import 'package:flutter/material.dart';

import '../../Model/banka_model.dart';
import 'package:dio/dio.dart';

class RemoteApi extends StatefulWidget {
  const RemoteApi({Key? key}) : super(key: key);

  @override
  State<RemoteApi> createState() => _RemoteApiState();
}

class _RemoteApiState extends State<RemoteApi> {

  Future<List<Bankalar>?> _getBankList() async{
    try{
      var response = await Dio().get("http://192.168.5.24/api/department");
      if(response.statusCode==200){
        debugPrint("Bankalar ==="+response.data.toString());
        return [];
      }
    }catch(e){
      debugPrint(e.toString());
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {
    _getBankList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bankalar"),
      ),
      body: const Center(),
    );
  }
}
