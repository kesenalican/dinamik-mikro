import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services/Providers/all_providers.dart';
import '../../styles/colors.dart';

class DetaySatir extends StatefulWidget {
  String? hangiOzellik;
  String? urunBilgi;

  DetaySatir(
      {Key? key, required this.hangiOzellik, required this.urunBilgi})
      : super(key: key);

  @override
  State<DetaySatir> createState() => _DetaySatirState();
}

class _DetaySatirState extends State<DetaySatir> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(MyColors.bg02),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Color(MyColors.bg01),
          ),
        ),
        child: Container(
          height: h * 0.05,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text(widget.hangiOzellik!)),
                const Expanded(flex: 1, child: Text(":")),
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.urunBilgi!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
