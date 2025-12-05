import 'package:flowva/core/controller/auth_controller.dart';
import 'package:flowva/gen/assets.gen.dart';
import 'package:flowva/view/widgets/color.dart';
import 'package:flowva/view/widgets/text.dart';
import 'package:flowva/view/widgets/textfield.dart';
import 'package:flowva/view/widgets/button.dart';
import 'package:flowva/view/widgets/toast_infos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _emailFilled = false;
  bool _passwordFilled = false;

  @override
  void initState() {
    super.initState();
    // Listen to text changes to update button state
    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _emailFilled = _emailController.text.trim().isNotEmpty;
      _passwordFilled = _passwordController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authController = context.read<AuthController>();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      final success = await authController.signInWithEmail(
        email: email,
        password: password,
      );

      if (success) {
        toastInfo(msg: 'Login successful!');
        // AuthWrapper will automatically navigate to HomeScreen
      }
    } catch (e) {
      // Handle different error types
      String errorMessage = 'Login failed. Please try again.';

      if (e.toString().contains('Invalid login credentials')) {
        errorMessage = 'Invalid email or password';
      } else if (e.toString().contains('Email not confirmed')) {
        errorMessage = 'Please verify your email before logging in';
      } else if (e.toString().contains('network')) {
        errorMessage = 'Network error. Please check your connection';
      }

      toastError(msg: errorMessage);
    }
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

                          // Form with validation
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                //email field
                                AuthTextFormField(
                                  controller: _emailController,
                                  hintText: 'Enter your email',
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  validator: _validateEmail,
                                ),
                                SizedBox(height: 8.spMin),

                                //password field
                                AuthTextFormField(
                                  controller: _passwordController,
                                  hintText: 'Enter your password',
                                  obscureText: _obscurePassword,
                                  validator: _validatePassword,
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
                              ],
                            ),
                          ),
                          SizedBox(height: 12.spMin),
                          //continue button
                          Consumer<AuthController>(
                            builder: (context, authController, child) {
                              final fieldsFilled =
                                  _emailFilled && _passwordFilled;

                              return CustomButton(
                                hintText: 'Continue',
                                color: Colors.black,
                                onTap:
                                    (authController.isLoading || !fieldsFilled)
                                    ? null
                                    : () async {
                                        await _handleLogin();
                                      },
                              );
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
