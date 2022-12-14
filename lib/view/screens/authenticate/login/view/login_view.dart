import 'package:dinamik_otomasyon/Model/firma_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/anasayfa/view/home_page.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/service/login_service.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class Login extends HookConsumerWidget {
  bool? rememberMe = false;

  Login({super.key});
  set value(bool? value) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController firmaController = useTextEditingController(text: '');
    TextEditingController kullaniciController =
        useTextEditingController(text: '');
    TextEditingController passwordController =
        useTextEditingController(text: '');
    var firmaList = ref.watch(firmaProvider);
    var userList = ref.watch(usersProvider);
    var dynamicHeight = MediaQuery.of(context).size.height;
    var dynamicWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(MyColors.primary),
          height: dynamicHeight,
          width: dynamicWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(
                  flex: 4,
                  child: _buildLogo(context, dynamicHeight, dynamicWidth)),
              const Spacer(),
              Expanded(
                flex: 1,
                child: firmaList.when(
                  loading: () => const CommonLoading(),
                  error: (error, stackTrace) => showAlertDialog(
                      context: context, hataBaslik: "Hata", hataIcerik: "Hata"),
                  data: (data) {
                    List<FirmaModel> firmaList = data.map((e) => e).toList();
                    return _buildFirmaField(
                      firmalist: firmaList,
                      firmaController: firmaController,
                      context: context,
                      dynamicHeight: dynamicHeight,
                      dynamicWidth: dynamicWidth,
                      hint: Constants.SIRKET_ADI,
                      prefixIcon: Icons.account_balance,
                      suffixIcon: Icons.replay_rounded,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: userList.when(
                  loading: () => const CommonLoading(),
                  error: (error, stackTrace) => showAlertDialog(
                      context: context, hataBaslik: "Hata", hataIcerik: "Hata"),
                  data: (data) {
                    List<UserModel> userList = data.map((e) => e).toList();
                    return _buildUserField(
                      context: context,
                      userController: kullaniciController,
                      userList: userList,
                      dynamicHeight: dynamicHeight,
                      dynamicWidth: dynamicWidth,
                      hint: Constants.KULLANICI_ADI,
                      prefixIcon: Icons.person,
                      suffixIcon: Icons.replay_rounded,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: _buildPasswordField(
                  context: context,
                  dynamicHeight: dynamicHeight,
                  dynamicWidth: dynamicWidth,
                  hint: "??ifre",
                  passwordController: passwordController,
                  prefixIcon: Icons.password,
                ),
              ),
              Expanded(
                child: _buildRememberMe(),
              ),
              Expanded(
                flex: 1,
                child: _buildLoginButton(
                  Constants.GIRIS_YAP, firmaController,
                  context, dynamicHeight, dynamicWidth,
                  // () {
                  //   if (kullaniciController.text != "" &&
                  //       passwordController.text != "") {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => HomePage(
                  //           sirketAdi: firmaController.text,
                  //         ),
                  //       ),
                  //     );
                  //   } else {
                  //     Future.delayed(
                  //       const Duration(seconds: 1),
                  //       () {
                  //         showAlertDialog(
                  //             context: context,
                  //             hataBaslik: "Sunucu Hatas??",
                  //             hataIcerik: "Girdi??iniz bilgiler yanl????.");
                  //       },
                  //     );
                  //   }
                  // },
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  _buildFirmaField({
    List<FirmaModel>? firmalist,
    TextEditingController? firmaController,
    double? dynamicHeight,
    double? dynamicWidth,
    context,
    String? hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicWidth! * 0.02, vertical: dynamicHeight! * 0.001),
      child: Form(
        child: Material(
            elevation: 8,
            shadowColor: Colors.black87,
            color: Colors.transparent,
            child: TextFormField(
              controller: firmaController,
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Color(MyColors.bg01),
              style: TextStyle(
                color: Color(
                  MyColors.bg01,
                ),
                fontSize: 12,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(
                    MyColors.bg01,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                focusColor: Color(MyColors.primary),
                prefixIcon: Icon(
                  prefixIcon,
                  color: Color(
                    MyColors.bg01,
                  ),
                ),
                suffix: InkWell(
                    onTap: () {
                      showFirmalar(context, firmalist!, firmaController!,
                          dynamicHeight, dynamicWidth);
                    },
                    child: Icon(
                      suffixIcon,
                      color: Color(
                        MyColors.bg01,
                      ),
                    )),
              ),
            )),
      ),
    );
  }

  _buildUserField({
    List<UserModel>? userList,
    TextEditingController? userController,
    double? dynamicHeight,
    double? dynamicWidth,
    context,
    String? hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicWidth! * 0.02, vertical: dynamicHeight! * 0.002),
      child: Form(
        child: Material(
            elevation: 8,
            shadowColor: Colors.black87,
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            child: TextFormField(
              controller: userController,
              textAlignVertical: TextAlignVertical.bottom,
              cursorColor: Color(MyColors.bg01),
              style: TextStyle(
                color: Color(
                  MyColors.bg01,
                ),
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Color(
                    MyColors.bg01,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                focusColor: Color(MyColors.primary),
                prefixIcon: Icon(
                  prefixIcon,
                  color: Color(
                    MyColors.bg01,
                  ),
                ),
                suffix: InkWell(
                    onTap: () {
                      showUsers(context, userList!, userController!,
                          dynamicHeight, dynamicWidth);
                    },
                    child: Icon(
                      suffixIcon,
                      color: Color(
                        MyColors.bg01,
                      ),
                    )),
              ),
            )),
      ),
    );
  }

  _buildPasswordField({
    TextEditingController? passwordController,
    double? dynamicHeight,
    double? dynamicWidth,
    context,
    String? hint,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicWidth! * 0.02, vertical: dynamicHeight! * 0.002),
      child: Form(
          child: Material(
        elevation: 8,
        shadowColor: Colors.black87,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            controller: passwordController,
            textAlignVertical: TextAlignVertical.bottom,
            cursorColor: Color(MyColors.bg01),
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Color(
                MyColors.bg01,
              ),
              fontSize: 15,
            ),
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 15,
                color: Color(
                  MyColors.bg01,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              focusColor: Color(MyColors.primary),
              prefixIcon: Icon(
                prefixIcon,
                color: Color(
                  MyColors.bg01,
                ),
              ),
            )),
      )),
    );
  }

  showUsers(context, List<UserModel> list, TextEditingController userController,
      double dynamicHeight, double dynamicWidth) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Kullan??c?? Se??iniz",
            style: purpleBoldTxtStyle,
          ),
          children: [
            SizedBox(
              height: dynamicHeight * 0.4,
              width: dynamicWidth * 0.5,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return SimpleDialogOption(
                    onPressed: () {
                      userController.text = list[index].kullaniciAdi;
                      Navigator.of(context).pop(UserModel(
                        kullaniciNo: list[index].kullaniciNo,
                        kullaniciKisaAdi: list[index].kullaniciKisaAdi,
                        kullaniciUzunAdi: list[index].kullaniciUzunAdi,
                        kullaniciAdi: list[index].kullaniciAdi,
                      ));
                    },
                    child: Text(
                      list[index].kullaniciAdi,
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

  showFirmalar(
      context,
      List<FirmaModel> list,
      TextEditingController firmaController,
      double dynamicHeight,
      double dynamicWidth) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Firma Se??iniz",
            style: purpleBoldTxtStyle,
          ),
          children: [
            SizedBox(
              height: dynamicHeight * 0.4,
              width: dynamicWidth * 0.5,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return SimpleDialogOption(
                    onPressed: () {
                      firmaController.text = list[index].firmaUnvan;
                      Navigator.of(context).pop(FirmaModel(
                          firmaUnvan: list[index].firmaUnvan,
                          siraNo: list[index].siraNo));
                    },
                    child: Text(
                      list[index].firmaUnvan,
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

  _buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.white,
          value: rememberMe,
          onChanged: (bool? value) {},
        ),
        const Text(
          Constants.BENI_HATIRLA,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  _buildLogo(context, double dynamicHeight, double dynamicWidth) {
    return Image(
      image: const AssetImage(Constants.LOGO),
      width: dynamicHeight * 0.3,
      height: dynamicWidth * 0.8,
    );
  }

  _buildLoginButton(String title, TextEditingController firmaController,
      context, double dynamicHeight, double dynamicWidth) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePage(sirketAdi: firmaController.text)));
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
            horizontal: dynamicWidth * 0.15, vertical: dynamicHeight * 0.02),
        shape: const StadiumBorder(),
        backgroundColor: Color(MyColors.header01),
        elevation: 8,
        shadowColor: Colors.black87,
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
