import 'package:aisu_realestate/app/app_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final bool isSelected;
  const CardWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            height: icon.contains("mpesa") ? 50 : 30,
          ),
          verticalSpaceSmall,
          ManropeText.bold(title, 14, kcBlackColor)
        ],
      ),
    );
  }
}
