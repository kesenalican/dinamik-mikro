import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OpenBarcod extends HookWidget {
  const OpenBarcod({super.key});

  @override
  Widget build(BuildContext context) {
    final barcode = useState('unknown');
    return InkWell(
      onTap: scanBarcode,
      child: CircleAvatar(
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

Future<void> scanBarcode() async {
  try {
    final barcode = await FlutterBarcodeScanner.scanBarcode(
      "#ff0000",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
  } catch (e) {
    return;
  }
}

class StokViewModel extends HookWidget {
  const StokViewModel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  buildCircularProgress() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
