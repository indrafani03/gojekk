import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_font_size.dart';
import 'package:gojek/ui/widgets/cardClub.dart';
import 'package:gojek/ui/widgets/card_info.dart';
import 'package:gojek/ui/widgets/custom_button_icon.dart';
import 'package:gojek/ui/widgets/custom_card.dart';
import 'package:gojek/ui/widgets/nav_button.dart';
import 'package:gojek/ui/widgets/scroll_brush.dart';
import 'package:gojek/ui/widgets/subtitle.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  var _scrollController = ScrollController();
  List<bool> tabBarBadgeList = [
    false,
    false,
    false,
    true,
  ];

  List tabBarList = [
    "Beranda",
    "Promo",
    "Pesanan",
    "Chat",
  ];

  int tabBarIndex = 0;
  int balanceBalance = 0;
  bool isBrush = true;
  bool isCollapseNavBottom = true;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 0) {
        isBrush = true;
        setState(() {});
      } else {
        isBrush = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget tabBarItem(int index) {
      return Expanded(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: double.infinity,
              decoration: BoxDecoration(
                color: (tabBarIndex == index)
                    ? MyColors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    tabBarIndex = index;
                  });
                },
                child: Center(
                  child: Text(
                    tabBarList[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: (tabBarIndex == index)
                          ? MyColors.darkGreen
                          : MyColors.white,
                      fontSize: MyFontSize.medium1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            if (tabBarBadgeList[index])
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(width: 1.5, color: MyColors.white),
                  ),
                  child: Center(
                    child: Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.5, color: MyColors.white),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      );
    }

    Widget tabBar() {
      return Container(
        margin: EdgeInsets.only(bottom: 15, top: 5),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          color: MyColors.darkGreen,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            tabBarItem(0),
            tabBarItem(1),
            tabBarItem(2),
            tabBarItem(3),
          ],
        ),
      );
    }

    Widget seaechBox() {
      return Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: BoxDecoration(
                color: MyColors.whiteL2,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 1.5, color: MyColors.softGrey),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: MyColors.blackText,
                    size: 35,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      "Cari Layanan, makanan, & tujuan",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(1000),
            child: Image.network(
              "https://us.123rf.com/450wm/vadymvdrobot/vadymvdrobot2003/vadymvdrobot200300051/142744663-image-of-a-young-strong-happy-cheery-sports-man-posing-outdoors-in-nature-green-park-looking-camera-.jpg?ver=6",
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          )
        ],
      );
    }

    Widget balance() {
      return Container(
        decoration: BoxDecoration(
          color: MyColors.blue,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Column(
              children: [
                ...List.generate(
                  2,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    height: 15,
                    width: 3,
                    decoration: BoxDecoration(
                      color: (balanceBalance == index)
                          ? MyColors.softGrey
                          : MyColors.softGrey,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 2.5,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/icons/gopay.png",
                            width: 90,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        "Saldo masih kosong",
                        style: TextStyle(color: MyColors.blackSoftText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9, top: 4),
                      child: Text(
                        "Klik buat isi",
                        style: TextStyle(
                            color: MyColors.green, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                height: 30,
                width: 30,
                fontSize: MyFontSize.medium2,
                fontColor: MyColors.white,
                isBold: false,
                iconPath: "assets/images/icons/ic_bayar.png",
                text: "Bayar",
              ),
            ),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                height: 30,
                width: 30,
                fontSize: MyFontSize.medium2,
                fontColor: MyColors.white,
                isBold: false,
                iconPath: "assets/images/icons/ic_topup.png",
                text: "Top Up",
              ),
            ),
            Expanded(
              child: CustomButtonIcon(
                action: () {},
                height: 30,
                width: 30,
                fontSize: MyFontSize.medium2,
                fontColor: MyColors.white,
                isBold: false,
                iconPath: "assets/images/icons/ic_eksplor.png",
                text: "Eksplor",
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.green,
        title: tabBar(),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(20),
            children: [
              seaechBox(),
              SizedBox(
                height: 10,
              ),
              balance(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CardClub(),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Subtitle(
                    iconPath: "assets/images/icons/ic_indoshop.png",
                    iconText: "IndoPayBefore",
                    subtitle: "Pake IndoPayBefore di Tokopedia",
                    caption:
                        "Belanja & nikmati beragam promo cashback istimewa hingga Rp 1.7 juta untuk-mu~"),
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => CardInfo(
                        imageUrl:
                            "https://lelogama.go-jek.com/prime/upload/image/50_million.png",
                        title: "Hadiah dari IndoJek buat perjalananmu!",
                        caption:
                            "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                      ),
                    )),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Subtitle(
                  iconPath: "assets/images/icons/ic_indoride.png",
                  iconText: "IndoJek",
                  subtitle: "Promo merdeka buat kamu",
                  caption:
                      "Ada diskon dari IndoJek/IndoCar, paket hemat IndoSend Instant, dan diskon IndoPay di sini!",
                  prefWidget: CustomCard(
                    onTap: () {},
                    padding: EdgeInsets.zero,
                    bgColor: MyColors.softGreen,
                    shadow: false,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text("Lihat Semua",
                          style: TextStyle(
                              color: MyColors.darkGreen,
                              fontSize: MyFontSize.medium2,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    5,
                    (index) => CardInfo(
                      imageUrl:
                          "https://lelogama.go-jek.com/prime/upload/image/2_million.png",
                      title: "Bongkar rahasia penjualan barang murah",
                      caption:
                          "Nikmatin perjalanan aman dan hemat naik IndoJek/IndoCar. Diskon sampai Rp 76.000 pake kode INDOMERDEKA. Klik!",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 120),
            ],
          ),
          if (isBrush)
            Align(alignment: Alignment.topCenter, child: ScrollBrush()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dy < 0) {
                    isCollapseNavBottom = false;
                    setState(() {});
                  }

                  if (details.delta.dy > 0) {
                    isCollapseNavBottom = true;
                    setState(() {});
                  }
                },
                child: NavBottom(
                  isCollapse: isCollapseNavBottom,
                )),
          ),
        ],
      ),
    );
  }
}
