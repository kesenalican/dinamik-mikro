import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class CariIletisimTab extends StatelessWidget {
  const CariIletisimTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adres No:1",
              style: purpleBoldTxtStyle,
            ),
            telefonBilgi(),
            faxBilgi(),
            konumBilgi(),
          ],
        ),
      ),
    );
  }

  Widget telefonBilgi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        border: Border.all(color: Color(MyColors.bg01), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                "Telefon No",
                style: purpleTxtStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                ":",
                style: purpleTxtStyle,
              )),
          const Expanded(
            flex: 1,
            child: CircleAvatar(
              child: Icon(
                Icons.add_call,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget faxBilgi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        border: Border.all(color: Color(MyColors.bg01), width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                "Fax no",
                style: purpleTxtStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                ":",
                style: purpleTxtStyle,
              )),
          const Expanded(
            flex: 1,
            child: CircleAvatar(
              child: Icon(
                Icons.print,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget konumBilgi() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        border: Border.all(color: Color(MyColors.bg01), width:2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                "Konum",
                style: purpleTxtStyle,
              )),
          Expanded(
              flex: 2,
              child: Text(
                ":",
                style: purpleTxtStyle,
              )),
          const Expanded(
            flex: 1,
            child: CircleAvatar(
              child: Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}