import 'package:flutter/material.dart';
import '../../Model/module_name.dart';
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Anasayfa"),
      drawer: DrawerMenu(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [

            const SizedBox(
              height: 10,
            ),
            const SearchInput(),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kartlar',
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[0],
                            )));
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;

  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(MyColors.yellow02),
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<Map> categories = [
  {'icon': Icons.switch_account, 'text': 'Müşteri Kartları'},
  {'icon': Icons.production_quantity_limits, 'text': 'Stok Kartları'},
  {'icon': Icons.info_outline, 'text': 'Ürün Bilgisi'},
  {'icon': Icons.account_balance, 'text': 'Cari Kartlar'},
];

class CategoryIcons extends StatelessWidget {
  const CategoryIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (var category in categories)
          CategoryIcon(
            icon: category['icon'],
            text: category['text'],
          ),
      ],
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'Mon, July 29',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              '11:00 ~ 12:10',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  IconData icon;
  String text;

  CategoryIcon({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(MyColors.bg),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                icon,
                color: Color(MyColors.primary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
