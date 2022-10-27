import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/open_barcode.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../styles/colors.dart';

class StokKartlari extends ConsumerStatefulWidget {
  const StokKartlari({super.key});

  @override
  ConsumerState<StokKartlari> createState() => _StokKartlariState();
}

class _StokKartlariState extends ConsumerState<StokKartlari> {
  int currentPage = 0;
  ScrollController scrollController = ScrollController();
  bool hasMore = true;
  bool refresh = false;
  List<Stoklar> emptyList = [];
  List<Stoklar> fullList = [];
  List<Stoklar> filteredList = [];
  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        ref.watch(stoklarProvider(currentPage = currentPage + 20));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    handleNext();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _runFilter(String searchKeyword) {
    List<Stoklar> results = [];
    if (searchKeyword.isEmpty) {
      results = emptyList;
    } else {
      results = emptyList
          .where((stok) =>
              stok.stokKodu.toLowerCase().contains(searchKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> handleRefresh() async {
      return await Future.delayed(
        const Duration(seconds: 2),
        () {
          refresh = false;
        },
      );
    }

    var liste = ref.watch(stoklarProvider(currentPage));
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: "Stoklar",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: context.dynamicWidth * 0.03,
                ),
                Expanded(flex: 6, child: _buildSearchInput()),
                const Expanded(
                  flex: 1,
                  child: OpenBarcod(),
                ),
              ],
            ),
            _buildListeleButton(),
            liste.when(data: (data) {
              currentPage == 0 ? ref.read(stoklarProvider(0)) : SizedBox;
              emptyList = data.map((e) => e).toList();
              fullList.addAll(emptyList);
              return RefreshIndicator(
                  onRefresh: handleRefresh,
                  color: Color(MyColors.bg01),
                  child: _buildStokKarti());
            }, error: (err, stack) {
              return Center(
                child: Text("Hata çıktı ${err.toString()}"),
              );
            }, loading: () {
              return Center(
                child: CircularProgressIndicator(
                  color: Color(MyColors.bg01),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  SizedBox _buildStokKarti() {
    return SizedBox(
      height: context.dynamicHeight * 0.73,
      width: double.infinity,
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < fullList.length) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StokDetay(
                              stokModel: fullList[index],
                            )));
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Card(
                  elevation: 4,
                  color: Color(MyColors.bg),
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(MyColors.bg01),
                        ),
                        SizedBox(
                          width: context.dynamicWidth * 0.01,
                        ),
                        _buildKodVeAd(index),
                        SizedBox(
                          width: context.dynamicWidth * 0.10,
                        ),
                        //FİYAT
                        _buildAdetVeFiyat(index),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Padding(
              padding: context.paddingDefault,
              child: Center(
                child: hasMore
                    ? CircularProgressIndicator(
                        color: Color(MyColors.bg01),
                      )
                    : const Text('Listenin sonuna ulaştınız.'),
              ),
            );
          }
        },
        itemCount: fullList.length + 1,
      ),
    );
  }

  Expanded _buildAdetVeFiyat(int index) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight * 0.006),
            child: Text(
              "Adet: ${fullList[index].stokFiyat.ceil().toString()}",
              style: TextStyle(
                color: Color(MyColors.bg01),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${fullList[index].stokFiyat.toString()} TL",
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Expanded _buildKodVeAd(int index) {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fullList[index].stokIsim,
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          SizedBox(
            height: context.dynamicHeight * 0.01,
          ),
          Text(
            fullList[index].stokKodu,
            style: TextStyle(
              color: Color(MyColors.bg01),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: Color(MyColors.purple02),
          ),
          SizedBox(
            width: context.dynamicWidth * 0.02,
          ),
          Expanded(
            child: TextField(
              onTap: () {},
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: Constants.ARA,
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildListeleButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: context.dynamicWidth * 0.03,
            vertical: context.dynamicHeight * 0.01),
        padding: context.paddingDefault,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(MyColors.bg01),
          ),
        ),
        child: const Center(
          child: Text(
            Constants.HEPSINI_LISTELE,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
