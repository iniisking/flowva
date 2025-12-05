import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowva/core/controller/auth_controller.dart';
import 'package:flowva/view/screens/authentication/login_screen.dart';
import 'package:flowva/view/screens/main/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = context.watch<AuthController>();

    // Show loading while checking auth state
    if (!authController.isInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Show appropriate screen based on auth state
    if (authController.isAuthenticated) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}

