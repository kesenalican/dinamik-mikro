import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/extensions/extensions.dart';
import 'package:flutter/material.dart';

import '../../constants/constant.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController? sirketController;
  TextEditingController? kullaniciController;
  TextEditingController? sifreController;
  bool rememberMe = false;

  set value(bool? value) {}

  @override
  void initState() {
    super.initState();
    sirketController = TextEditingController();
    kullaniciController = TextEditingController();
    sifreController = TextEditingController();
  }

  @override
  void dispose() {
    sirketController?.dispose();
    kullaniciController?.dispose();
    sifreController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(MyColors.primary),
          height: context.dynamicHeight,
          width: context.dynamicWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(flex: 4, child: Logo()),
              Spacer(),
              Expanded(
                flex: 1,
                child: inputField(Constants.SIRKET_ADI, Icons.account_balance,
                    sirketController!),
              ),
              Expanded(
                flex: 1,
                child: inputField(Constants.KULLANICI_ADI,
                    Icons.supervised_user_circle, kullaniciController!),
              ),
              Expanded(
                flex: 1,
                child: inputField(
                    Constants.SIFRE, Icons.password, sifreController!),
              ),
              Expanded(
                child: buildRememberMe(),
              ),
              Expanded(
                flex: 1,
                child: loginButton(Constants.GIRIS_YAP),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRememberMe() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.white,
          value: rememberMe,
          onChanged: (bool? value) {
            setState(() {
              this.value = value;
            });
          },
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

  Widget Logo() {
    return Container(
      child: Image(
        image: const AssetImage(Constants.LOGO),
        width: context.dynamicHeight*0.3,
        height: context.dynamicWidth*0.8,
      ),
    );
  }

  Widget inputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth*0.08, vertical: context.dynamicHeight*0.014),
      child: Form(
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            controller: controller,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: hint,
              focusColor: Color(MyColors.primary),
              prefixIcon: Icon(iconData),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              sirketAdi: sirketController!.text,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth * 0.35, vertical: context.dynamicHeight * 0.02),
        shape: const StadiumBorder(),
        primary: Color(MyColors.header01),
        elevation: 8,
        shadowColor: Colors.black87,
      ),
      child: Text(
        title,
        style: context.theme.textTheme.headline6?.copyWith(color: Colors.white),
      ),
    );
  }
}
