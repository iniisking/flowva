import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flowva/core/controller/auth_controller.dart';
import 'package:flowva/view/widgets/button.dart';
import 'package:flowva/view/widgets/toast_infos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _handleLogout(BuildContext context) async {
    final authController = context.read<AuthController>();

    try {
      await authController.signOut();
      toastInfo(msg: 'Logged out successfully');
      // AuthWrapper will automatically navigate to LoginScreen
    } catch (e) {
      toastError(msg: 'Failed to logout. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Consumer<AuthController>(
          builder: (context, authController, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                if (authController.user != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    'Email: ${authController.user!.email}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
                const SizedBox(height: 32),
                CustomButton(
                  hintText: 'Logout',
                  color: Colors.red,
                  onTap: authController.isLoading
                      ? null
                      : () async {
                          await _handleLogout(context);
                        },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
