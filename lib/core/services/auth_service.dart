import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flowva/core/services/supabase_service.dart';

class AuthService {
  final SupabaseClient _supabase = SupabaseService.client;

  /// Sign in with email and password
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  /// Get current user
  User? get currentUser => _supabase.auth.currentUser;

  /// Sign out
  Future<void> signOut() async {
    await _supabase.auth.signOut();
  }

  /// Stream of auth state changes
  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}

