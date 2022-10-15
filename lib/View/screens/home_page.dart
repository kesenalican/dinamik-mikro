import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../Model/module_name.dart';
import '../../constants/constant.dart';
import 'stokIslemleri/stok_listele.dart';
import '../common/common_appbar.dart';
import '../common/common_drawer.dart';
import '../common/module_card_button.dart';
import '../common/search_input.dart';
import '../styles/colors.dart';
import 'module_card.dart';

class HomePage extends StatefulWidget {
  String? sirketAdi;

  HomePage({
    Key? key,
    this.sirketAdi,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.ANASAYFA),
      drawer: const DrawerMenu(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            SizedBox(height: context.dynamicHeight * 0.01),
            const SearchInput(),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.KARTLAR,
                  style: context.theme.textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StokListele()));
              },
              cardName: Modules[0],
              iconData: const Icon(Icons.attach_money_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[1],
                            )));
              },
              cardName: Modules[1],
              iconData: const Icon(Icons.account_tree_sharp),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[2],
                            )));
              },
              cardName: Modules[2],
              iconData: const Icon(Icons.info_outline_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[3],
                            )));
              },
              cardName: Modules[3],
              iconData: const Icon(Icons.warehouse),
            ),
          ],
        ),
      ),
    );
  }
}



