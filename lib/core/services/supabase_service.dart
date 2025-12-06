import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static bool _isInitialized = false;
  
  static Future<void> initialize({
    required String supabaseUrl,
    required String supabaseAnonKey,
  }) async {
    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw Exception('Supabase URL and Anon Key must not be empty');
    }
    
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
    
    _isInitialized = true;
  }

  static SupabaseClient get client {
    if (!_isInitialized) {
      throw Exception('Supabase has not been initialized. Call SupabaseService.initialize() first.');
    }
    return Supabase.instance.client;
  }
}

