import 'package:dinamik_otomasyon/Services/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/View/screens/cariIslemler/cari_kartlar.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constants/constant.dart';
import '../../common/common_appbar.dart';
import '../../common/search_input.dart';
import '../../styles/colors.dart';

class CariListele extends ConsumerWidget {
  const CariListele({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(whichPage: Constants.CARILER),
      body: RefreshIndicator(
        onRefresh: ()async{
          ref.read(carilerProvider);
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                padding:EdgeInsets.all(2),
                child: const SearchInput(),
              ),
              buildListeleButton(context),
              const CariKartlar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListeleButton(context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin:const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(MyColors.bg01),
          ),
        ),
        child: const Center(
          child: Text(
            Constants.HEPSINI_LISTELE,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
