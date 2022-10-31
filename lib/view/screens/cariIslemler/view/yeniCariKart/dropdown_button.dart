import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
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
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(10),
          elevation: 3,
          dropdownColor: Color(MyColors.bg01),
          icon: Icon(Icons.arrow_downward),
          hint: Text("Şehir Seçiniz.."),
          style: TextStyle(
            fontSize: 15,
          ),
          onChanged: (String? selectedItem) {
            setState(() {
              _selectedItem = selectedItem;
            });
          },
          items: _birimler
              .map((String oankiBirim) => DropdownMenuItem(
                    child: Text(oankiBirim),
                    value: oankiBirim,
                  ))
              .toList(),
          value: _selectedItem,
        ),
      ),
    );
  }
}
