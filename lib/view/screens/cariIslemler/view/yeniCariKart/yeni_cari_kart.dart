import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class YeniCariKart extends HookWidget {
  const YeniCariKart({super.key});

  @override
  Widget build(BuildContext context) {
    final cariKoduController = useTextEditingController(text: '');
    final cariUnvanController = useTextEditingController(text: '');
    final verginoController = useTextEditingController(text: '');
    final vergiDaireController = useTextEditingController(text: '');
    final yetkiliAdiController = useTextEditingController(text: '');
    final yetkiliSoyAdiController = useTextEditingController(text: '');
    final adres1Controller = useTextEditingController(text: '');
    final adres2Controller = useTextEditingController(text: '');
    final ilController = useTextEditingController(text: '');
    final ilceController = useTextEditingController(text: '');
    final ulkeController = useTextEditingController(text: '');
    final ulkeKoduController = useTextEditingController(text: '(90)');
    final telefon1Controller = useTextEditingController(text: '');
    final telefon2Controller = useTextEditingController(text: '');
    final faxController = useTextEditingController(text: '');
    final mailController = useTextEditingController(text: '');

    return Scaffold(
      appBar: CommonAppbar(whichPage: "Yeni Cari Oluştur"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.save,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCommonTextField(
              context,
              controller: cariKoduController,
              field: "Cari Kodu",
              icon: Icons.code,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: cariUnvanController,
              field: "Cari Ünvanı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            _buildVergiNoTextField(verginoController),
            _buildCommonTextField(
              context,
              controller: vergiDaireController,
              field: "Vergi Dairesi",
              icon: Icons.account_balance,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: yetkiliAdiController,
              field: "Yetkili Adı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: yetkiliSoyAdiController,
              field: "Yetkili Soyadı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: adres1Controller,
              field: "Adres 1",
              icon: Icons.location_city,
              textInputType: TextInputType.streetAddress,
            ),
            _buildCommonTextField(
              context,
              controller: adres2Controller,
              field: "Adres 2",
              icon: Icons.location_city,
              textInputType: TextInputType.streetAddress,
            ),
            _buildCommonTextField(
              context,
              controller: ilController,
              field: "İl",
              icon: Icons.map,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: ilceController,
              field: "İlçe",
              icon: Icons.maps_home_work,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: ulkeController,
              field: "Ülke",
              icon: Icons.maps_home_work_sharp,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: ulkeKoduController,
              field: "Ülke Kodu",
              icon: Icons.maps_home_work_sharp,
              textInputType: TextInputType.number,
            ),
            _buildCommonTextField(
              context,
              controller: telefon1Controller,
              field: "Telefon 1",
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            _buildCommonTextField(
              context,
              controller: telefon2Controller,
              field: "Telefon 2",
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            _buildCommonTextField(
              context,
              controller: faxController,
              field: "Fax",
              icon: Icons.fax,
              textInputType: TextInputType.name,
            ),
            _buildCommonTextField(
              context,
              controller: mailController,
              field: "E-mail",
              icon: Icons.mail,
              textInputType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }

  _buildVergiNoTextField(TextEditingController verginoController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Vergi No Boş Olamaz!" : null,
        controller: verginoController,
        keyboardType: TextInputType.number,
        cursorColor: Color(MyColors.bg01),
        decoration: InputDecoration(
          labelText: "Vergi No",
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.account_balance,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {},
            child: Icon(Icons.replay_outlined,
                color: Color(
                  MyColors.bg01,
                )),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }

  _buildCommonTextField(context,
      {TextEditingController? controller,
      String? field,
      IconData? icon,
      TextInputType? textInputType}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "$field Boş Olamaz!" : null,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Color(MyColors.bg01),
        style: TextStyle(
          color: Color(
            MyColors.bg01,
          ),
        ),
        decoration: InputDecoration(
          labelText: field,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            icon,
            color: Color(MyColors.bg01),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
