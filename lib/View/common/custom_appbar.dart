import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CustomAppBar extends StatefulWidget {
  String? kullanciAdi;
   CustomAppBar({
    Key? key, this.kullanciAdi,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              'Merhaba',
              style: TextStyle(fontWeight: FontWeight.w500,color: Color(MyColors.bg01),),
            ),
            Text(
             widget.kullanciAdi!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(MyColors.bg01),),
            ),
          ],
        ),

        IconButton(
          icon: Icon(Icons.settings),
          onPressed: (){

          },
          iconSize: 40,
          color: Color(MyColors.bg01),
        ),

      ],
    );
  }
}