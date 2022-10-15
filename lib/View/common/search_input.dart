import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import '../styles/colors.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}
class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: context.paddingDefault,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Color(MyColors.bg01),),
      ),
      padding:context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color(MyColors.purple02),
          ),
           SizedBox(
            width: context.dynamicWidth*0.02,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Constants.ARA,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}