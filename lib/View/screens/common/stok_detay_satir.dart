import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class StokDetaySatir extends StatefulWidget {
  String? stokOzellik;
  String? aciklama;

  StokDetaySatir({Key? key, required this.stokOzellik, required this.aciklama})
      : super(key: key);

  @override
  State<StokDetaySatir> createState() => _StokDetaySatirState();
}

class _StokDetaySatirState extends State<StokDetaySatir> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(MyColors.bg02),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Color(MyColors.bg01),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  flex: 2,
                  child: Text(widget.stokOzellik!)),
              const Expanded(
                  flex: 1,
                  child: Text(":")),
              Expanded(
                  flex: 2,
                  child: Text(widget.aciklama!)),
            ],
          ),
        ),
      ),
    );
  }
}
