import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/login.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.DINAMIK_OTOMASYON,
      home: Login(),
    );
  }
}
