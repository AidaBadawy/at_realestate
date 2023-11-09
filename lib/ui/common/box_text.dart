import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class RubikText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final TextAlign alignment;
  final Color textColor;

  RubikText.thin(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.extraLight(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.light(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.regular(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
            fontSize: fontSize, fontWeight: FontWeight.w400, color: textColor),
        alignment = align,
        super(key: key);

  RubikText.medium(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.mediumSpacing(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: textColor,
            letterSpacing: 2.03),
        alignment = align,
        super(key: key);

  RubikText.semiBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.bold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.extraBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  RubikText.black(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}

class InterText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final TextAlign alignment;
  final Color textColor;

  InterText.thin(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.extraLight(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.light(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.regular(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
            fontSize: fontSize, fontWeight: FontWeight.w400, color: textColor),
        alignment = align,
        super(key: key);

  InterText.medium(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.semiBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.bold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.extraBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  InterText.black(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}

class PoppinsText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final TextAlign alignment;
  final Color textColor;
  final int? maxLine;

  PoppinsText.thin(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.extraLight(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.light(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.regular(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: textColor,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        alignment = align,
        super(key: key);

  PoppinsText.medium(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
          textStyle: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        alignment = align,
        super(key: key);

  PoppinsText.semiBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.bold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.extraBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 5})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  PoppinsText.black(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, this.maxLine = 0})
      : style = GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      style: style,
      textAlign: alignment,
    );
  }
}

class ManropeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final TextAlign alignment;
  final Color textColor;

  ManropeText.thin(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w100,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.extraLight(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w200,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.light(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.regular(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          // fontSize: setFontSize(fontSize),

          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.medium(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.semiBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          // fontSize: setFontSize(fontSize),

          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.bold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start, double spacing = 0})
      : style = GoogleFonts.manrope(
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            color: textColor,
            letterSpacing: spacing),
        alignment = align,
        super(key: key);

  ManropeText.extraBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  ManropeText.black(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.manrope(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}

class DancingText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextStyle style;
  final TextAlign alignment;
  final Color? textColor;

  DancingText.regular(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.dancingScript(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  DancingText.medium(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.dancingScript(
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  DancingText.semiBold(this.text, this.fontSize, this.textColor,
      {Key? key, TextAlign align = TextAlign.start})
      : style = GoogleFonts.dancingScript(
          fontSize: fontSize,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  DancingText.bold(
    this.text,
    this.fontSize,
    this.textColor, {
    Key? key,
    TextAlign align = TextAlign.start,
  })  : style = GoogleFonts.dancingScript(
          fontSize: setFontSize(fontSize),
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
        alignment = align,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: alignment,
    );
  }
}

double setFontSize(font) {
  double fontSize = 6;

  switch (font) {
    case 6:
      fontSize = 6.sp;

      break;

    case 14:
      fontSize = 10.7.sp;

      break;

    case 20:
      fontSize = 15.sp;

      break;

    case 26:
      fontSize = 20.sp;
      // fontSize = 26;

      break;
    default:
  }

  return fontSize;
}
