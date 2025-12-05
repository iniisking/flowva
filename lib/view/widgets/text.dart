import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;
  final double letterSpacing;
  final TextDecoration decoration;
  final Color decorationColor;
  final double? height;
  final String? fontFamily;

  const CustomTextWidget({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines,
    this.letterSpacing = 0.0,
    this.decoration = TextDecoration.none,
    this.decorationColor = Colors.transparent,
    this.height,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = fontFamily == 'DM Sans'
        ? GoogleFonts.dmSans(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing,
            decoration: decoration,
            decorationColor: decorationColor,
            height: height,
          )
        : GoogleFonts.inter(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            letterSpacing: letterSpacing,
            decoration: decoration,
            decorationColor: decorationColor,
            height: height,
          );

    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: textStyle,
    );
  }
}
