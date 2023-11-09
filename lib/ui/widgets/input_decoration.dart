import 'package:aisu_realestate/app/app_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InputDecoration inputDecorationOne({
  required String hint,
  required Color enabledColor,
  required Color focusedColor,
  required Color errorColor,
  String? suffixIcon,
  Function? onTapSuffix,

  // required String labelText,
  // required Widget suffixIcon,
}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    hintText: hint,
    hintStyle: manropeRegularFonts.copyWith(fontSize: 12, color: enabledColor),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: enabledColor),
    ),
    suffixIcon: suffixIcon == null
        ? null
        : InkWell(
            onTap: () => onTapSuffix!(),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(suffixIcon),
            ),
          ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: focusedColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: errorColor),
    ),
  );
}
