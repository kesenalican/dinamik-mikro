import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/open_barcode.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/viewmodel/stok_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
  List<Stoklar> bosliste = [];

  void handleNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        ref.read(stoklarProvider(currentPage = currentPage + 20));
        setState(() {
          refresh = true;
        });
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

  @override
  Widget build(BuildContext context) {
    print("build oluyorum");
    Future<void> handleRefresh() async {
      return await Future.delayed(
        const Duration(seconds: 2),
        () {
          currentPage = 0;
          refresh = false;
          print(
              "Handlea girdim ??? ŞU ANKİ CURRENTPAGE DEĞERİ == $currentPage");
        },
      );
    }

    var liste = ref.watch(stoklarProvider(currentPage));
    return Scaffold(
      appBar: CommonAppbar(
        whichPage: "Stoklar",
      ),
      body: Column(
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

            bosliste = data.map((e) => e).toList();
            return RefreshIndicator(
                onRefresh: handleRefresh,
                color: Color(MyColors.bg01),
                child: _buildStokKarti(context, bosliste));
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
    );
  }

  SizedBox _buildStokKarti(BuildContext context, List<Stoklar> liste) {
    return SizedBox(
      height: context.dynamicHeight * 0.73,
      width: double.infinity,
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < liste.length) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StokDetay(
                              stokModel: liste[index],
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
                        _buildKodVeAd(liste, index, context),
                        SizedBox(
                          width: context.dynamicWidth * 0.10,
                        ),
                        //FİYAT
                        _buildAdetVeFiyat(context, liste, index),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            print(" BEN SON PAGE'IM CIRCULAR ÇALIŞ pageSize == ${currentPage}");
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
        itemCount: liste.length + 1,
      ),
    );
  }

  Expanded _buildAdetVeFiyat(
      BuildContext context, List<Stoklar> liste, int index) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(context.dynamicHeight * 0.006),
            child: Text(
              "Adet: ${liste[index].stokFiyat.ceil().toString()}",
              style: TextStyle(
                color: Color(MyColors.bg01),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "${liste[index].stokFiyat.toString()} TL",
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

  Expanded _buildKodVeAd(List<Stoklar> liste, int index, BuildContext context) {
    return Expanded(
      flex: 9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${liste[index].stokIsim}",
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
            "${liste[index].stokKodu}",
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

// class StokKartlari extends ConsumerWidget {
//   const StokKartlari({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     int currentPage = 1;
//     Future<void> handleRefresh() async {
//       return await Future.delayed(
//         const Duration(seconds: 2),
//         () {
//           //return ref.read(stoklarProvider);
//         },
//       );
//     }

//     var liste = ref.watch(stoklarProvider(currentPage));
//     //List<Stoklar> liste = StokViewModel().stoklarVeriGetir(1, 5);
//     return Padding(
//       padding: EdgeInsets.all(context.dynamicHeight * 0.001),
//       child: SingleChildScrollView(
//         child: LiquidPullToRefresh(
//           onRefresh: handleRefresh,
//           color: Color(
//             MyColors.bg01,
//           ),
//           height: context.dynamicHeight * 0.1,
//           animSpeedFactor: 2,
//           child: liste.when(
//             data: (data) {
//               List liste = data.map((e) => e).toList();
//               return ListView.builder(
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => StokDetay(
//                                     stokModel: liste[index],
//                                   )));
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.all(5),
//                       child: Card(
//                         elevation: 4,
//                         color: Color(MyColors.bg),
//                         margin: EdgeInsets.zero,
//                         child: Padding(
//                           padding: EdgeInsets.all(context.dynamicHeight * 0.01),
//                           child: Row(
//                             children: [
//                               CircleAvatar(
//                                 backgroundColor: Color(MyColors.bg01),
//                               ),
//                               SizedBox(
//                                 width: context.dynamicWidth * 0.01,
//                               ),
//                               Expanded(
//                                 flex: 9,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       liste[index].stokIsim,
//                                       style: TextStyle(
//                                         color: Color(MyColors.bg01),
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 12,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 2,
//                                     ),
//                                     SizedBox(
//                                       height: context.dynamicHeight * 0.01,
//                                     ),
//                                     Text(
//                                       liste[index].stokKodu,
//                                       style: TextStyle(
//                                         color: Color(MyColors.bg01),
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: context.dynamicWidth * 0.10,
//                               ),
//                               //FİYAT
//                               Expanded(
//                                 flex: 2,
//                                 child: Column(
//                                   children: [
//                                     Padding(
//                                       padding: EdgeInsets.all(
//                                           context.dynamicHeight * 0.006),
//                                       child: Text(
//                                         "Adet: ${liste[index].stokFiyat.ceil().toString()}",
//                                         style: TextStyle(
//                                           color: Color(MyColors.bg01),
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w600,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                     Text(
//                                       "${liste[index].stokFiyat.toString()} TL",
//                                       style: TextStyle(
//                                         color: Color(MyColors.bg01),
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.w600,
//                                       ),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: liste.length,
//               );
//             },
//             error: (err, stack) {
//               return Center(
//                 child: Text("Hata çıktı ${err.toString()}"),
//               );
//             },
//             loading: () => Center(
//               child: CircularProgressIndicator(
//                 color: Color(MyColors.bg01),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
