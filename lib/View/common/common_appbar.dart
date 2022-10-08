import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CommonAppbar extends StatefulWidget implements PreferredSizeWidget {
  String? whichPage;

    CommonAppbar( {Key? key, required this.whichPage}) : super(key: key);

  @override
  State<CommonAppbar> createState() => _CommonAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);

}

class _CommonAppbarState extends State<CommonAppbar> {
   @override


  @override
  Widget build(BuildContext context) {
    return AppBar(
        title:  Text(
          widget.whichPage!,
          style: TextStyle(
            color: Colors.white,
          ),
        ),

        backgroundColor: Color(MyColors.bg01),

    );
  }
}
