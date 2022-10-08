import 'package:dinamik_otomasyon/View/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'View/common/charts_ornek.dart';
import 'View/screens/settings.dart';

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
      home: HomePage(),
    );
  }
}
