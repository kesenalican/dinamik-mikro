import 'package:dinamik_otomasyon/View/styles/colors.dart';
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          color: Color(MyColors.primary),
          height: h,
          width: w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.15,
              ),
              Logo(),
              SizedBox(
                height: h * 0.15,
              ),
              inputField(Constants.SIRKET_ADI  , Icons.account_balance, sirketController!),
              inputField(Constants.KULLANICI_ADI, Icons.supervised_user_circle,
                  kullaniciController!),
              inputField(Constants.SIFRE, Icons.password, sifreController!),
              Row(
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
              ),
              loginButton(Constants.GIRIS_YAP),
            ],
          ),
        ),
      ),
    );
  }

  Widget Logo() {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      child: Image(
        image:const  AssetImage(Constants.LOGO),
        width: w * 0.7,
        height: h * 0.2,
      ),
    );
  }

  Widget inputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: SizedBox(
        height: 50,
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
      ),
    );
  }

  Widget loginButton(String title) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
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
        padding: EdgeInsets.symmetric(horizontal: w * 0.35, vertical: h * 0.02),
        shape: const StadiumBorder(),
        primary: Color(MyColors.header01),
        elevation: 8,
        shadowColor: Colors.black87,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
