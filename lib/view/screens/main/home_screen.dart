import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flowva/view/widgets/text.dart';
import 'package:flowva/gen/assets.gen.dart';
import 'dart:async';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer;
  int _days = 3;
  int _hours = 24;
  int _minutes = 0;
  int _seconds = 0;
  final int _referralCount = 1;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else if (_minutes > 0) {
        setState(() {
          _minutes--;
          _seconds = 59;
        });
      } else if (_hours > 0) {
        setState(() {
          _hours--;
          _minutes = 59;
          _seconds = 59;
        });
      } else if (_days > 0) {
        setState(() {
          _days--;
          _hours = 23;
          _minutes = 59;
          _seconds = 59;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _copyReferralLink() {
    Clipboard.setData(const ClipboardData(text: 'https://Bravoo.ref.12419'));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Referral link copied!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF28015C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.spMin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.spMin),
                // Back arrow and header
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomTextWidget(
                          text: 'Enter to win the Oraimo\nOpenSnap!',
                          fontSize: 18.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 48.spMin), // Balance the back button
                  ],
                ),

                // Earbuds
                Center(
                  child: Assets.image.oraimoEarbuds.image(
                    width: 152.spMin,
                    height: 130.spMin,
                    fit: BoxFit.contain,
                  ),
                ),
                // Eclipse shadow under earbuds
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.5.spMin),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 76.spMin,
                        height: 9.spMin,
                        decoration: BoxDecoration(
                          color: const Color(0xFF000000),
                          borderRadius: BorderRadius.circular(4.5.spMin),
                        ),
                      ),
                    ),
                  ),
                ),
                // Platform cube
                Center(
                  child: Assets.svg.platformCube.svg(
                    width: 104.spMin,
                    height: 148.spMin,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 24.spMin),
                // Draw ends in text
                Center(
                  child: CustomTextWidget(
                    text: 'DRAW ENDS IN',
                    fontSize: 14.spMin,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.spMin),
                // Countdown timer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTimerBox('$_days', 'Days'),
                    SizedBox(width: 8.spMin),
                    CustomTextWidget(
                      text: ':',
                      fontSize: 24.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.spMin),
                    _buildTimerBox('$_hours', 'Hours'),
                    SizedBox(width: 8.spMin),
                    CustomTextWidget(
                      text: ':',
                      fontSize: 24.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.spMin),
                    _buildTimerBox('$_minutes', 'Mins'),
                    SizedBox(width: 8.spMin),
                    CustomTextWidget(
                      text: ':',
                      fontSize: 24.spMin,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.spMin),
                    _buildTimerBox('$_seconds', 'Secs'),
                  ],
                ),
                SizedBox(height: 24.spMin),
                // Participant count
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.spMin,
                    vertical: 12.spMin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.spMin),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: '4,327 USERS HAVE ENTERED SO FAR',
                        fontSize: 12.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.spMin),
                // Qualification rule section
                Container(
                  padding: EdgeInsets.all(16.spMin),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3A0270),
                    borderRadius: BorderRadius.circular(12.spMin),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.image.megaphoneIcon.image(
                        width: 24.spMin,
                        height: 24.spMin,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 12.spMin),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'QUALIFICATION RULE',
                              fontSize: 14.spMin,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            SizedBox(height: 8.spMin),
                            CustomTextWidget(
                              text:
                                  'Invite at least 2 friends who sign up through your link to qualify.',
                              fontSize: 13.spMin,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.spMin),
                // Entry status button
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.spMin,
                    vertical: 16.spMin,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50),
                    borderRadius: BorderRadius.circular(12.spMin),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check, color: Colors.white),
                      SizedBox(width: 8.spMin),
                      CustomTextWidget(
                        text: "You've Entered",
                        fontSize: 16.spMin,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.spMin),
                Center(
                  child: CustomTextWidget(
                    text: 'Your entry is confirmed for this draw.',
                    fontSize: 13.spMin,
                    fontWeight: FontWeight.w400,
                    color: Colors.white60,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16.spMin),
                // Profile avatars
                Center(
                  child: SizedBox(
                    width: 48.spMin, // Width of 2 avatars with overlap
                    height: 32.spMin,
                    child: Stack(
                      children: [
                        Positioned(left: 0, child: _buildAvatar()),
                        Positioned(
                          left: 16.spMin, // Overlap by 16px
                          child: _buildAvatar(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.spMin),
                // Invite friends section
                CustomTextWidget(
                  text: 'Invite your friends quick & easy.',
                  fontSize: 16.spMin,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: 12.spMin),
                // Referral link
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.spMin,
                    vertical: 14.spMin,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.spMin),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextWidget(
                          text: 'https://Bravoo.ref.12419',
                          fontSize: 14.spMin,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                      GestureDetector(
                        onTap: _copyReferralLink,
                        child: Assets.svg.copyIcon.svg(
                          width: 20.spMin,
                          height: 20.spMin,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.spMin),
                // Social media buttons
                Row(
                  children: [
                    Expanded(
                      child: _buildSocialButton(
                        icon: Assets.image.whatsappIcon.image(
                          width: 20.spMin,
                          height: 20.spMin,
                          fit: BoxFit.contain,
                        ),
                        label: 'Whatsapp',
                        color: const Color(0xFF25D366),
                      ),
                    ),
                    SizedBox(width: 12.spMin),
                    Expanded(
                      child: _buildSocialButton(
                        icon: Assets.image.xIcon.image(
                          width: 20.spMin,
                          height: 20.spMin,
                          fit: BoxFit.contain,
                        ),
                        label: 'X (Twitter)',
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 12.spMin),
                    Expanded(
                      child: _buildSocialButton(
                        icon: Assets.image.linkedInIcon.image(
                          width: 20.spMin,
                          height: 20.spMin,
                          fit: BoxFit.contain,
                        ),
                        label: 'Linkedin',
                        color: const Color(0xFF0077B5),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.spMin),
                // Referral count at bottom
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomTextWidget(
                          text: 'You referred',
                          fontSize: 13.spMin,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 4.spMin),
                        Icon(
                          Icons.info_outline,
                          size: 16.spMin,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 20.spMin,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 4.spMin),
                        CustomTextWidget(
                          text: '$_referralCount',
                          fontSize: 16.spMin,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.spMin),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimerBox(String value, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.spMin, vertical: 8.spMin),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(8.spMin),
      ),
      child: Column(
        children: [
          CustomTextWidget(
            text: value.padLeft(2, '0'),
            fontSize: 20.spMin,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: 4.spMin),
          CustomTextWidget(
            text: label,
            fontSize: 10.spMin,
            fontWeight: FontWeight.w400,
            color: Colors.white60,
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 32.spMin,
      height: 32.spMin,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        color: Colors.grey[300],
      ),
      child: ClipOval(
        child: Icon(Icons.person, size: 20.spMin, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildSocialButton({
    required Widget icon,
    required String label,
    required Color color,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle social media share
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.spMin, vertical: 12.spMin),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.spMin),
        ),
        child: Column(
          children: [
            icon,
            SizedBox(height: 6.spMin),
            CustomTextWidget(
              text: label,
              fontSize: 11.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
