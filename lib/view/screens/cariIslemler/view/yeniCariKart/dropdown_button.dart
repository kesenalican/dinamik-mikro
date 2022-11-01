import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropDownButton extends ConsumerStatefulWidget {
  const DropDownButton({super.key});

  @override
  ConsumerState<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends ConsumerState<DropDownButton> {
  String? _selectedItem = null;
  List<String> _birimler = ["Türk Lirası", "Dolar", "Euro", "Sterlin"];
  @override
  Widget build(BuildContext context) {
    var vergiDaireleri = ref.watch(vergiDaireleriProvider);

    return vergiDaireleri.when(
      data: (data) {
        List<VergiDaireModel> list = data.map((e) => e).toList();
        return DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          dropdownColor: Color(MyColors.bg),
          icon: Icon(
            Icons.arrow_downward,
            color: Color(MyColors.bg01),
          ),
          hint: const Text("Vergi Dairesi Seçiniz.."),
          style: TextStyle(
            fontSize: 15,
            color: Color(MyColors.bg01),
          ),
          onChanged: (String? selectedItem) {
            setState(() {
              _selectedItem = selectedItem;
            });
          },
          items: _birimler
              .map((String? oankiBirim) => DropdownMenuItem(
                    value: oankiBirim,
                    child: Text(oankiBirim!),
                  ))
              .toList(),
          value: _selectedItem,
        );
      },
      error: ((error, stackTrace) => showAlertDialog(
          context: context, hataBaslik: "HAta", hataIcerik: "HAta")),
      loading: () => const CommonLoading(),
    );
  }
}
