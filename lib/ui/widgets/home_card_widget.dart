import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final String data;
  final Color cardColor;
  final Color iconColor;
  final Color textColor;
  final Color? datatextColor;
  final String icon;
  final double? right;
  final double? top;
  final double? titleFontSize;
  final double? dataFontSize;
  final double? iconSize;
  final bool? isProperty;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.data,
    required this.cardColor,
    required this.iconColor,
    required this.textColor,
    this.datatextColor = kcBlackColor,
    required this.icon,
    this.right = -8,
    this.top = 0,
    this.titleFontSize = 14,
    this.dataFontSize = 20,
    this.iconSize = 60,
    this.isProperty = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          elevation: 2,
          color: cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            height: 95,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
                // borderRadius: BorderRadius.circular(8),
                // color: cardColor,
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.blueGrey,
                //     offset: Offset(
                //       5.0,
                //       5.0,
                //     ),
                //     blurRadius: 1.0,
                //     spreadRadius: 2.0,
                //   ),
                // ]
                // border: Border.all(color: iconColor, width: .2),
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isProperty!) ManropeText.semiBold("KES", 12, kcLightGrey),
                const Spacer(),
                ManropeText.semiBold(data, dataFontSize!, textColor),
                ManropeText.regular(title, titleFontSize!, datatextColor!),
              ],
            ),
          ),
        ),
        Positioned(
          right: right,
          top: top,
          child: Transform.rotate(
            angle: 0,
            child: SvgPicture.asset(
              icon,
              height: iconSize,
              color: iconColor.withOpacity(.3),
            ),
          ),
        )
      ],
    );
  }
}
