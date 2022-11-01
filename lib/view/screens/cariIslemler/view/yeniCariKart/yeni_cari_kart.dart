import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/common_textfield.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class YeniCariKart extends HookConsumerWidget {
  const YeniCariKart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cariKoduController = useTextEditingController(text: '');
    final cariUnvanController = useTextEditingController(text: '');
    final verginoController = useTextEditingController(text: '');
    final vergiDaireController = useTextEditingController(text: '');
    final vergiDaireKoduController = useTextEditingController(text: '');
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

    var list = ref.watch(vergiDaireleriProvider);
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
            CommonTextField(
              controller: cariKoduController,
              field: "CariKodu",
              icon: Icons.code,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: cariUnvanController,
              field: "Cari Ünvanı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            list.when(
                error: (err, stack) => showAlertDialog(
                    context: context, hataBaslik: "hata", hataIcerik: "hata"),
                loading: () => const CommonLoading(),
                data: (data) {
                  List<VergiDaireModel> vergiDaireleri =
                      data.map((e) => e).toList();
                  return _buildVergiDairesiTextField(vergiDaireController,
                      context, vergiDaireleri, vergiDaireKoduController);
                }),
            CommonTextField(
              controller: vergiDaireKoduController,
              field: "Vergi Daire Kodu",
              icon: Icons.account_balance,
              textInputType: TextInputType.number,
            ),
            CommonTextField(
              controller: verginoController,
              field: "Vergi No",
              icon: Icons.account_balance,
              textInputType: TextInputType.number,
            ),
            CommonTextField(
              controller: yetkiliAdiController,
              field: "Yetkili Adı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: yetkiliSoyAdiController,
              field: "Yetkili Soyadı",
              icon: Icons.person,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: adres1Controller,
              field: "Adres 1",
              icon: Icons.location_city,
              textInputType: TextInputType.streetAddress,
            ),
            CommonTextField(
              controller: adres2Controller,
              field: "Adres 2",
              icon: Icons.location_city,
              textInputType: TextInputType.streetAddress,
            ),
            CommonTextField(
              controller: ilController,
              field: "İl",
              icon: Icons.map,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: ilceController,
              field: "İlçe",
              icon: Icons.maps_home_work,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: ulkeController,
              field: "Ülke",
              icon: Icons.maps_home_work_sharp,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              controller: ulkeKoduController,
              field: "Ülke Kodu",
              icon: Icons.maps_home_work_sharp,
              textInputType: TextInputType.number,
            ),
            CommonTextField(
              controller: telefon1Controller,
              field: "Telefon 1",
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            CommonTextField(
              controller: telefon2Controller,
              field: "Telefon 2",
              icon: Icons.phone,
              textInputType: TextInputType.phone,
            ),
            CommonTextField(
              controller: faxController,
              field: "Fax",
              icon: Icons.fax,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
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

  _buildVergiDairesiTextField(
      TextEditingController vergiDaireController,
      context,
      List<VergiDaireModel> list,
      TextEditingController vergiDaireKoduController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Vergi No Boş Olamaz!" : null,
        controller: vergiDaireController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: "Vergi Dairesi",
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
            onTap: () {
              showVergiDaireleri(context, list, vergiDaireController,
                  vergiDaireKoduController);
            },
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

  showVergiDaireleri(
      context,
      List<VergiDaireModel> list,
      TextEditingController vergiDaireController,
      TextEditingController vergiDaireKoduController) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Vergi Dairesi Seçiniz",
            style: purpleBoldTxtStyle,
          ),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchInput(),
            ),
            SizedBox(
              height: context.dynamicHeight * 0.4,
              width: context.dynamicWidth * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SimpleDialogOption(
                    onPressed: () {
                      vergiDaireController.text = list[index].vergiDaireAdi;
                      vergiDaireKoduController.text =
                          list[index].vergiDaireKodu;
                      Navigator.of(context).pop(VergiDaireModel(
                          vergiDaireKodu: list[index].vergiDaireKodu,
                          vergiDaireAdi: list[index].vergiDaireAdi,
                          vergiDaireIl: list[index].vergiDaireIl));
                    },
                    child: Text(
                      list[index].vergiDaireAdi,
                      style: purpleTxtStyle,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}



// ListView.builder(
//           itemBuilder: (context, index) {
//             return SimpleDialog(
//                 title: const Text('Vergi Dairesi Seç'),
//                 children: [
//                   Text(list[index].vergiDaireAdi),
//                 ]);
//           },
//         );
/**
 * 
 * <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Text one'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Text two'),
            ),
          ],
 */