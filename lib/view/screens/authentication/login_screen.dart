import 'package:flowva/gen/assets.gen.dart';
import 'package:flowva/view/widgets/color.dart';
import 'package:flowva/view/widgets/text.dart';
import 'package:flowva/view/widgets/textfield.dart';
import 'package:flowva/view/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.image.logInBackgroundBlur.provider(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Modal bottom sheet overlay
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 624.spMin,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.spMin),
                  topRight: Radius.circular(24.spMin),
                ),
              ),
              child: Column(
                children: [
                  // Handle
                  Container(
                    margin: EdgeInsets.only(top: 12.spMin),
                    width: 40.spMin,
                    height: 4.spMin,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2.spMin),
                    ),
                  ),
                  // Content will go here
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 24.spMin),
                      child: Column(
                        children: [
                          SizedBox(height: 36.spMin),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextWidget(
                              text: 'Continue to Login',
                              fontSize: 20.spMin,
                              color: textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.spMin),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: CustomTextWidget(
                              text: "Let's get you started.",
                              fontSize: 16.spMin,
                              color: textColor2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 20.spMin),

                          //email field
                          AuthTextFormField(
                            controller: _emailController,
                            hintText: 'Enter your email',
                            keyboardType: TextInputType.emailAddress,
                            autofillHints: const [AutofillHints.email],
                          ),
                          SizedBox(height: 8.spMin),

                          //password field
                          AuthTextFormField(
                            controller: _passwordController,
                            hintText: 'Enter your password',
                            obscureText: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: textColor2,
                                size: 20.spMin,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            autofillHints: const [AutofillHints.password],
                          ),
                          SizedBox(height: 12.spMin),
                          //continue button
                          CustomButton(
                            hintText: 'Continue',
                            color: Colors.black,
                            onTap: () async {
                              // Handle login logic here
                            },
                          ),
                          SizedBox(height: 12.spMin),
                          //forgot password
                          Align(
                            alignment: Alignment.centerRight,
                            child: CustomTextWidget(
                              text: 'Forgot your password?',
                              fontSize: 15.spMin,
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          SizedBox(height: 20.spMin),
                          CustomTextWidget(
                            text: 'OR',
                            fontSize: 12.spMin,
                            color: textColor2,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 16.spMin),
                          //oauth button
                          OAuthButton(
                            hintText: 'Continue with Google',
                            icon: Assets.svg.googleSvg.svg(
                              width: 20.spMin,
                              height: 20.spMin,
                            ),
                            onTap: () async {
                              // Handle Google OAuth logic here
                            },
                          ),
                          SizedBox(height: 4.spMin),
                          OAuthButton(
                            hintText: 'Continue with Apple',
                            icon: Assets.svg.apple.svg(
                              width: 20.spMin,
                              height: 20.spMin,
                            ),
                            onTap: () async {
                              // Handle Apple OAuth logic here
                            },
                          ),
                          SizedBox(height: 22.spMin),
                          //sign up text
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: GoogleFonts.manrope(
                                fontSize: 15.spMin,
                                color: textColor2,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -0.5,
                                height:
                                    20 /
                                    15, // line-height: 20px / font-size: 15px
                              ),
                              children: [
                                const TextSpan(text: "Don't have an account? "),
                                TextSpan(
                                  text: 'Sign up',
                                  style: GoogleFonts.manrope(
                                    color: primaryColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.spMin,
                                    letterSpacing: -0.5,
                                    height: 20 / 15,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle sign up navigation
                                    },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6.spMin),
                          //rules and policies text
                          Text(
                            'By continuing you agree to the Rules and Policy',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.manrope(
                              fontSize: 15.spMin,
                              fontWeight: FontWeight.w400,
                              letterSpacing: -0.5,
                              height:
                                  20 /
                                  15, // line-height: 20px / font-size: 15px
                              color:
                                  textColor2, // Same as "Don't have an account?"
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
