import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/anasayfa/view/home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BaseState<Login> {
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
          height: dynamicHeight(1),
          width: dynamicWidth(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              Expanded(flex: 4, child: _buildLogo()),
              const Spacer(),
              Expanded(
                flex: 1,
                child: _buildInputField(Constants.SIRKET_ADI,
                    Icons.account_balance, sirketController!),
              ),
              Expanded(
                flex: 1,
                child: _buildInputField(Constants.KULLANICI_ADI,
                    Icons.supervised_user_circle, kullaniciController!),
              ),
              Expanded(
                flex: 1,
                child: _buildInputField(
                    Constants.SIFRE, Icons.password, sifreController!),
              ),
              Expanded(
                child: _buildRememberMe(),
              ),
              Expanded(
                flex: 1,
                child: _buildLoginButton(Constants.GIRIS_YAP),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
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

  _buildLogo() {
    return Container(
      child: Image(
        image: const AssetImage(Constants.LOGO),
        width: dynamicHeight(0.3),
        height: dynamicWidth(0.8),
      ),
    );
  }

  _buildInputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dynamicWidth(0.03), vertical: dynamicHeight(0.01)),
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

  _buildLoginButton(String title) {
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
        padding: EdgeInsets.symmetric(
            horizontal: dynamicWidth(0.15), vertical: dynamicHeight(0.02)),
        shape: const StadiumBorder(),
        primary: Color(MyColors.header01),
        elevation: 8,
        shadowColor: Colors.black87,
      ),
      child: Text(
        title,
        style: theme.textTheme.headline6?.copyWith(color: Colors.white),
      ),
    );
  }
}
