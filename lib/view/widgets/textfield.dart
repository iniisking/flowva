// ignore_for_file: must_be_immutable

import 'package:flowva/view/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? maxLines;
  final bool readOnly;
  final bool enabled;
  Iterable<String>? autofillHints;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final double padding;
  final Color? fillColor;

  AuthTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.maxLines = 1,
    this.readOnly = false,
    this.enabled = true,
    this.autofillHints,
    this.height = 56,
    this.borderRadius = 16,
    this.borderWidth = 1,
    this.padding = 18,
    this.fillColor,
  });

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.spMin),
      borderSide: BorderSide(color: color, width: borderWidth.spMin),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.spMin,
      child: TextFormField(
        autofillHints: autofillHints,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: maxLines,
        readOnly: readOnly,
        enabled: enabled,
        cursorColor: primaryColor2,
        style: GoogleFonts.dmSans(
          fontSize: 16.spMin,
          color: textColor,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.32, // -2% of 16px
          height: 20 / 16, // line-height: 20px / font-size: 16px
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(
            fontSize: 16.spMin,
            color: textColor2,
            fontWeight: FontWeight.w400,
            letterSpacing: -0.32, // -2% of 16px
            height: 20 / 16, // line-height: 20px / font-size: 16px
          ),
          filled: true,
          fillColor: fillColor ?? Colors.transparent,
          contentPadding: EdgeInsets.all(padding.spMin),
          focusedBorder: _buildBorder(borderColor),
          focusedErrorBorder: _buildBorder(redErrorColor),
          enabledBorder: _buildBorder(borderColor),
          errorBorder: _buildBorder(redErrorColor),
          disabledBorder: _buildBorder(borderColor),
          errorStyle: GoogleFonts.dmSans(
            fontSize: 12.spMin,
            color: redErrorColor,
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
