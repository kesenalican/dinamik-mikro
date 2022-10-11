import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_karti.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import '../../../Model/stok_depo_detay.dart';
import '../../common/search_input.dart';
import '../../styles/colors.dart';
import 'package:dio/dio.dart';


class StokListele extends StatefulWidget {
  const StokListele({Key? key}) : super(key: key);

  @override
  State<StokListele> createState() => _StokListeleState();
}

class _StokListeleState extends State<StokListele> {
  Future<List<StokDepoDetay>?> _getStokDetay() async{
    try{
      var response = await Dio().get("http://192.168.5.24:5239/api/StokDepoDetaylari");
      List<StokDepoDetay> _stokList = [];
      if(response.statusCode == 200){
        _stokList = (response.data as List).map((e) => StokDepoDetay.fromMap(e)).toList();

      }
      return _stokList;
    }on DioError catch(e){
      return Future.error(e.message);
    }
  }
  
  late final Future<List<StokDepoDetay>?> _stokList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _stokList = _getStokDetay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Stok Listele"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SearchInput(),
            ),
            //Hepsini Listele Butonu
            GestureDetector(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(MyColors.bg01),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(MyColors.bg01),
                  ),
                ),
                child:const Center(
                  child: Text(
                    "Hepsini Listele",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            const StokKartlari(),
           // StokKartlari2(),

          ],
        ),
      ),
    );
  }
}
