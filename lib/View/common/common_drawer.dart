import 'package:dinamik_otomasyon/View/screens/faturaIslemleri/satisFaturasi/satis_faturasi.dart';
import 'package:dinamik_otomasyon/View/screens/stokIslemleri/stok_listele.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import '../../constants/constant.dart';
import '../screens/cariIslemler/cari_listele.dart';
import '../screens/login.dart';
import '../screens/module_card.dart';
import '../screens/settings.dart';
import '../styles/colors.dart';
import 'menu_components.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<Menu> data = [];

  @override
  void initState() {
    dataList.forEach((element) {
      data.add(Menu.fromJson(element));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: context.dynamicHeight * 0.15,
            child: UserAccountsDrawerHeader(
              accountName:  const Text(Constants.DINAMIK_OTOMASYON),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Color(MyColors.bg01),
              ),
              currentAccountPictureSize: Size.zero,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _buildList(data[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildList(Menu list) {
  if (list.subMenu!.isEmpty) {
    return Builder(builder: (context) {
      return ListTile(
          focusColor: Color(MyColors.bg01),
          hoverColor: Color(MyColors.bg01),
          selectedTileColor: Color(MyColors.bg01),
          textColor: Color(MyColors.bg01),
          onTap: list.name == Constants.AYARLAR
              ? () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()))
              : list.name == Constants.CIKIS
                  ? () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Login()))
                  : list.name == "Stok Kart Detay"
                      ? () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StokListele()))
                      : list.name == Constants.CARI_ISLEMLER
                          ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CariListele()))
                          : list.name == "Satış Faturaları"
                              ? () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SatisFaturasi()))
                              : () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScheduleTab(
                                            cardName: list.name,
                                          ))),
          leading: Icon(
            Icons.next_plan,
            color: Color(MyColors.bg01),
          ),
          title: Text(
            list.name!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ));
    });
  }
  return ExpansionTile(
    trailing: Icon(
      Icons.arrow_drop_down_circle_outlined,
      color: Color(MyColors.bg01),
    ),
    textColor: Color(MyColors.bg01),
    iconColor: Color(MyColors.bg01),
    leading: Icon(
      list.icon,
      color: Color(MyColors.bg01),
    ),
    title: Text(
      list.name!,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(MyColors.bg01)),
    ),
    children: list.subMenu!.map(_buildList).toList(),
  );
}
