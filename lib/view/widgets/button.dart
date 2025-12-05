//general custom button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowva/view/widgets/text.dart';

class CustomButton extends StatelessWidget {
  final String? hintText;
  final Widget? text;
  final Future<void> Function()? onTap;
  final Color? color;
  final double height;
  final double borderRadius;
  final Color borderColor;
  final double? width;
  final double borderWidth;
  final double padding;
  final double gap;

  const CustomButton({
    super.key,
    this.hintText,
    this.text,
    required this.onTap,
    this.color,
    this.height = 56,
    this.borderRadius = 16,
    this.borderColor = const Color(0xFFCDCDCD),
    this.width,
    this.borderWidth = 1,
    this.padding = 18,
    this.gap = 8,
  }) : assert(
         hintText != null || text != null,
         'Either hintText or text must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height.spMin,
        padding: EdgeInsets.all(padding.spMin),
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius.spMin),
          border: Border.all(color: borderColor, width: borderWidth.spMin),
        ),
        alignment: Alignment.center,
        child: hintText != null
            ? CustomTextWidget(
                text: hintText!,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                letterSpacing: -0.32, // -2% of 16px
                height: 20 / 16, // line-height: 20px / font-size: 16px
                fontFamily: 'DM Sans',
              )
            : text,
      ),
    );
  }
}
