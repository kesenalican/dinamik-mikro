import 'package:dinamik_otomasyon/View/screens/cariIslemler/cari_kartlar.dart';
import 'package:dinamik_otomasyon/View/screens/doctor_detail.dart';
import 'package:dinamik_otomasyon/View/screens/home_page.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_detay.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_listele.dart';
import 'package:flutter/material.dart';
import 'View/screens/cariIslemler/cari_detay.dart';
import 'View/screens/login.dart';
import 'View/screens/settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';

import 'constants/constant.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.DINAMIK_OTOMASYON,
      home: Login(),
    );
  }
}
