import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Function onTap;
  final bool isDisabled;
  final bool isBusy;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.fontSize = 14,
      required this.isDisabled,
      required this.isBusy});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: isDisabled ? () {} : () => onTap(),
        color: isDisabled ? kcLightGrey : kcPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        height: 50,
        child: ManropeText.bold(text, fontSize!, kcWhiteColor),
      ),
    );
  }
}
