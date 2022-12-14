// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/view/styles/colors.dart';

// ignore: must_be_immutable
class CommonDropDown extends StatefulWidget {
  List<String> list;
  String listName;
  CommonDropDown({
    Key? key,
    required this.list,
    required this.listName,
  }) : super(key: key);

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(10),
      elevation: 3,
      dropdownColor: Color(MyColors.bg),
      icon: Icon(
        Icons.arrow_downward,
        color: Color(MyColors.bg01),
      ),
      hint: Text(
        widget.listName,
        style: purpleTxtStyle,
      ),
      style: TextStyle(
        fontSize: 15,
        color: Color(MyColors.bg01),
      ),
      onChanged: (String? selectedItem) {
        setState(() {
          _selectedItem = selectedItem;
        });
      },
      items: widget.list
          .map((String? oankiBirim) => DropdownMenuItem(
                value: oankiBirim,
                child: Text(
                  oankiBirim!,
                  overflow: TextOverflow.ellipsis,
                ),
              ))
          .toList(),
      value: _selectedItem,
    );
  }
}
