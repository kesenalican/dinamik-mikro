import 'package:dinamik_otomasyon/View/screens/remote_api.dart';
import 'package:flutter/material.dart';
import 'View/screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dinamik Otomasyon',
      home: Login(),
    );
  }
}
