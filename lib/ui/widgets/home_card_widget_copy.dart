import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeCardWidgetCopy extends StatelessWidget {
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
  final double? height;
  final bool? isProperty;
  const HomeCardWidgetCopy({
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
    this.height = 95,
    this.isProperty = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: cardColor,
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     Color(0xFFe53935),
        //     Color(0xFFffd5d3),
        //   ],
        // ),
        boxShadow: [
          BoxShadow(
            color: kcVeryLightGrey.withOpacity(.7),
            offset: const Offset(
              3.0,
              3.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 1.0,
          ),
        ],
        // border: Border.all(color: iconColor, width: .5),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
      ),
    );
  }
}
