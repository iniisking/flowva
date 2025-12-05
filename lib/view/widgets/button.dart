//general custom button
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowva/view/widgets/text.dart';
import 'package:flowva/view/widgets/color.dart';

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
  final double topMargin;
  final double leftMargin;

  const CustomButton({
    super.key,
    this.hintText,
    this.text,
    required this.onTap,
    this.color,
    this.height = 48,
    this.borderRadius = 100,
    this.borderColor = const Color(0xFFCDCDCD),
    this.width,
    this.borderWidth = 1,
    this.padding = 18,
    this.gap = 8,
    this.topMargin = 0,
    this.leftMargin = 0,
  }) : assert(
         hintText != null || text != null,
         'Either hintText or text must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: topMargin.spMin, left: leftMargin.spMin),
        padding: EdgeInsets.all(4.spMin),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0x269013FE), // #9013FE26 - 15% opacity
            width: 1.spMin,
          ),
          borderRadius: BorderRadius.circular((borderRadius + 4).spMin),
        ),
        child: Container(
          width: width ?? double.infinity,
          height: height.spMin,

          decoration: BoxDecoration(
            gradient: color != null
                ? null
                : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF2A2A2A), // Lighter dark grey at top
                      const Color(0xFF050505), // Very dark in middle
                      const Color(0xFF000000), // Pure black
                      const Color(0xFF000000), // Pure black at bottom
                    ],
                    stops: const [0.0, 0.2, 0.4, 1.0],
                  ),
            color: color,
            borderRadius: BorderRadius.circular(borderRadius.spMin),
            border: Border.all(color: borderColor, width: borderWidth.spMin),
            boxShadow: [
              // Outer shadows - creating depth and "popping out" effect
              BoxShadow(
                color: const Color(0x1A000000), // #0000001A
                offset: Offset(0, -1.spMin), // Slight upward offset
                blurRadius: 15.spMin,
                spreadRadius: -2.spMin, // Negative to shrink inward
              ),
              BoxShadow(
                color: const Color(0x17000000), // #00000017
                offset: Offset(0, -1.spMin),
                blurRadius: 15.spMin,
                spreadRadius: -2.spMin,
              ),
              BoxShadow(
                color: const Color(0x0D000000), // #0000000D
                offset: Offset(0, -1.spMin),
                blurRadius: 9.spMin,
                spreadRadius: -1.spMin,
              ),
              BoxShadow(
                color: const Color(0x03000000), // #00000003
                offset: Offset(0, -1.spMin),
                blurRadius: 10.spMin,
                spreadRadius: -1.spMin,
              ),
              BoxShadow(
                color: const Color(0x00000000), // #00000000
                offset: Offset(0, -1.spMin),
                blurRadius: 11.spMin,
                spreadRadius: -1.spMin,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius.spMin),
            child: Stack(
              children: [
                // Inner shadow/highlight - same dimensions as container
                // Inset shadow: -4px 13px 19px 0px #ECD6FF80
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius.spMin),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color(0xA0ECD6FF), // Brighter purple at top
                        const Color(
                          0x80ECD6FF,
                        ), // #ECD6FF80 - prominent purple glow
                        const Color(0x50ECD6FF), // Fading
                        const Color(0x20ECD6FF), // More fading
                        Colors.transparent,
                      ],
                      stops: const [0.0, 0.15, 0.4, 0.7, 1.0],
                    ),
                  ),
                ),
                // Content
                Center(
                  child: hintText != null
                      ? CustomTextWidget(
                          text: hintText!,
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: -0.32, // -2% of 16px
                          height:
                              20 / 16, // line-height: 20px / font-size: 16px
                          fontFamily: 'Manrope',
                          textAlign: TextAlign.center,
                        )
                      : text,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//oauth button
class OAuthButton extends StatelessWidget {
  final String? hintText;
  final Widget? text;
  final Widget? icon;
  final Future<void> Function()? onTap;
  final double? width;
  final double topMargin;
  final double leftMargin;

  const OAuthButton({
    super.key,
    this.hintText,
    this.text,
    this.icon,
    required this.onTap,
    this.width,
    this.topMargin = 4,
    this.leftMargin = 4,
  }) : assert(
         hintText != null || text != null,
         'Either hintText or text must be provided',
       );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: topMargin.spMin, left: leftMargin.spMin),
        padding: EdgeInsets.all(4.spMin),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0x261C636F), // #1C636F26 - 15% opacity
            width: 1.spMin,
          ),
          borderRadius: BorderRadius.circular(104.spMin), // 100 + 4
        ),
        child: Container(
          width: width ?? double.infinity,
          height: 48.spMin,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF), // #FFFFFF
                Color(0xFFF3F3F3), // #F3F3F3
              ],
            ),
            borderRadius: BorderRadius.circular(100.spMin),
            border: Border.all(color: const Color(0xFFCDCDCD), width: 1.spMin),
            boxShadow: [
              BoxShadow(
                color: const Color(0x1A000000), // #0000001A
                offset: Offset(0, 1.spMin),
                blurRadius: 1.spMin,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: const Color(0x17000000), // #00000017
                offset: Offset(0, 2.spMin),
                blurRadius: 2.spMin,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: const Color(0x0D000000), // #0000000D
                offset: Offset(0, 6.spMin),
                blurRadius: 3.spMin,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: const Color(0x03000000), // #00000003
                offset: Offset(0, 10.spMin),
                blurRadius: 4.spMin,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: const Color(0x00000000), // #00000000
                offset: Offset(0, 16.spMin),
                blurRadius: 4.spMin,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.spMin,
              vertical: 14.spMin,
            ),
            child: Row(
              children: [
                if (icon != null) icon!,
                Expanded(
                  child: hintText != null
                      ? CustomTextWidget(
                          text: hintText!,
                          fontSize: 14.spMin, // Body/Size Small
                          fontWeight: FontWeight.w400,
                          color: oauthTextColor, // #2C2C2C
                          letterSpacing: 0,
                          height: 1.0, // 100% line-height
                          fontFamily: 'DM Sans',
                          textAlign: TextAlign.center,
                        )
                      : Center(child: text ?? const SizedBox()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
