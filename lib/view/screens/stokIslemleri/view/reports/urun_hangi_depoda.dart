import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UrunHangiDepoda extends HookConsumerWidget {
  final Stoklar stokModel;
  const UrunHangiDepoda({
    super.key,
    required this.stokModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stokKodu1 = useTextEditingController(text: stokModel.stokKodu);
    final stokKodu2 = useTextEditingController(text: stokModel.stokKodu);
    final stokKoduText = useState(stokModel.stokKodu);
    final stokCinsi = useState(stokModel.stokIsim);

    return Scaffold(
      appBar: CommonAppbar(
        whichPage: 'Rapor Parametreleri',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStokFilter(context, stokKodu1),
            _buildStokFilter(context, stokKodu1),
            SizedBox(
              height: context.dynamicHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildEmailButton(),
                SizedBox(
                  width: context.dynamicWidth * 0.02,
                ),
                _buildGoruntuleButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildGoruntuleButton() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(MyColors.bg01),
          child: const Icon(
            Icons.document_scanner,
          ),
        ),
        Text(
          "Görüntüle",
          style: purpleTxtStyle,
        ),
      ],
    );
  }

  Column _buildEmailButton() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(MyColors.bg01),
          child: const Icon(
            Icons.email,
          ),
        ),
        Text(
          "E-mail",
          style: purpleTxtStyle,
        ),
      ],
    );
  }

  Container _buildStokFilter(
      BuildContext context, TextEditingController stokKodu1) {
    return Container(
      margin: context.paddingDefault * 1.2,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(MyColors.bg01),
        ),
      ),
      child: Card(
        elevation: 10,
        color: Color(MyColors.bg),
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            SizedBox(
              width: context.dynamicWidth * 0.04,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Constants.STOK_KODU,
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.07,
                  ),
                  const Text(
                    Constants.STOK_ISIM,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ":",
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.07,
                  ),
                  const Text(":"),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  TextField(
                    controller: stokKodu1,
                    cursorColor: Color(MyColors.bg01),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: context.dynamicHeight * 0.00001),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.05,
                  ),
                  Text(stokModel.stokIsim),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
