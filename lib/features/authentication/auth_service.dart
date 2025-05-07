import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthResponseModel {
  final Session? session;
  final User? user;

  AuthResponseModel({required this.session, required this.user});
}

class AuthService {
  final SupabaseClient supabaseClient;

  AuthService({required this.supabaseClient});
  Future<AuthResponseModel> registerEmailAndPassword({required String email, required String password}) async {
    try {
      final AuthResponse response = await supabaseClient.auth.signUp(email: email, password: password);
      final User? user = response.user;
      final Session? session = response.session;

      return AuthResponseModel(session: session, user: user);
    } on FormatException {
      rethrow;
    } on AuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Future<AuthResponseModel> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final AuthResponse response = await supabaseClient.auth.signInWithPassword(email: email, password: password);
      final User? user = response.user;
      final Session? session = response.session;

      return AuthResponseModel(session: session, user: user);
    } on FormatException {
      rethrow;
    } on AuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }
}
