import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

class SupabaseConfig {
  // Try to get from dotenv first, then fallback to system environment variables
  static String get supabaseUrl => 
      dotenv.env['SUPABASE_URL'] ?? 
      Platform.environment['SUPABASE_URL'] ?? 
      '';
  
  static String get supabaseAnonKey => 
      dotenv.env['SUPABASE_ANON_KEY'] ?? 
      Platform.environment['SUPABASE_ANON_KEY'] ?? 
      '';
}

