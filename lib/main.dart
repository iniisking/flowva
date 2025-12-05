import 'package:flowva/config/supabase_config.dart';
import 'package:flowva/core/services/supabase_service.dart';
import 'package:flowva/core/controller/auth_controller.dart';
import 'package:flowva/core/auth/auth_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables (if .env file exists, otherwise use system env vars)
  try {
    await dotenv.load(fileName: '.env');
  } catch (e) {
    // .env file doesn't exist (e.g., in CI/CD), use system environment variables
    // Environment variables can be set in CI/CD workflows
  }

  // Initialize Supabase
  await SupabaseService.initialize(
    supabaseUrl: SupabaseConfig.supabaseUrl,
    supabaseAnonKey: SupabaseConfig.supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AuthController())],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flowva',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: const AuthWrapper(),
          ),
        );
      },
    );
  }
}
