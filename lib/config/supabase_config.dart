import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';

class SupabaseConfig {
  // Try to get from dotenv first, then fallback to system environment variables
  static String get supabaseUrl {
    try {
      final dotenvUrl = dotenv.env['SUPABASE_URL'];
      if (dotenvUrl != null && dotenvUrl.isNotEmpty) {
        return dotenvUrl;
      }
    } catch (e) {
      // dotenv not loaded yet, continue to next option
    }

    final platformUrl = Platform.environment['SUPABASE_URL'];
    if (platformUrl != null && platformUrl.isNotEmpty) {
      return platformUrl;
    }

    return 'https://yfrenhxruerubrtjwtyb.supabase.co';
  }

  static String get supabaseAnonKey {
    try {
      final dotenvKey = dotenv.env['SUPABASE_ANON_KEY'];
      if (dotenvKey != null && dotenvKey.isNotEmpty) {
        return dotenvKey;
      }
    } catch (e) {
      // dotenv not loaded yet, continue to next option
    }

    final platformKey = Platform.environment['SUPABASE_ANON_KEY'];
    if (platformKey != null && platformKey.isNotEmpty) {
      return platformKey;
    }

    return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmcmVuaHhydWVydWJydGp3dHliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ5MzIwNzgsImV4cCI6MjA4MDUwODA3OH0.NNd7cbq_lknXss-mxHN_EEC7_tZ-w3lI_XjnsA9eclA';
  }
}
