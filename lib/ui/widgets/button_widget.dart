import 'dart:io';

import 'package:aisu_realestate/ui/common/app_colors.dart';
import 'package:aisu_realestate/ui/common/box_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Function onTap;
  final bool isDisabled;
  final bool isBusy;
  final double height;
  final Color? btnColor;
  final Color? loaderColor;
  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.fontSize = 14,
      required this.isDisabled,
      required this.height,
      this.btnColor = kcBlueColor,
      this.loaderColor = kcWhiteColor,
      required this.isBusy});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        onPressed: isDisabled ? () {} : () => onTap(),
        color: isDisabled ? kcLightGrey : btnColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        height: height,
        child: isBusy
            ? SizedBox(
                height: 20,
                width: 20,
                child: Platform.isIOS
                    ? CupertinoActivityIndicator(
                        color: loaderColor,
                      )
                    : CircularProgressIndicator(
                        color: loaderColor,
                        strokeWidth: 4,
                      ),
              )
            : ManropeText.semiBold(text, fontSize!, kcWhiteColor),
      ),
    );
  }
}
