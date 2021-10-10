import 'package:flutter/material.dart';
import 'package:gojek/common/my_colors.dart';
import 'package:gojek/common/my_style.dart';
import 'package:gojek/ui/widgets/custom_card.dart';

class CardClub extends StatelessWidget {
  const CardClub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: EdgeInsets.all(20),
      bgColor: MyColors.white,
      shadow: true,
      shadowOpacity: .5,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/icons/ic_indoclub.png",
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        "goClub",
                        style: MyStyle.textTitleBlack,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Text("Program Loyalitas gojek",
                    style: MyStyle.textParagraphBlack)
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CustomCard(
            onTap: () {},
            padding: EdgeInsets.zero,
            bgColor: MyColors.green,
            shadow: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Ikutan Gratis", style: MyStyle.textButtonWhite),
            ),
          )
        ],
      ),
    );
  }
}
