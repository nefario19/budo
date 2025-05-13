import 'package:loglytics/loglytics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService with Loglytics {
  AuthService(this._client);
  final SupabaseClient _client;
  Session? _session;
  Session? get session => _session;
  late final Stream<AuthState> _authSubscription;

  bool loading = false;
  String? userEmail;

  Future<void> signUpWithEmailAndPassword({required String email, required String password}) async {
    log.info('Signing up $email');
    try {
      final AuthResponse response = await _client.auth.signUp(email: email, password: password);
      _session = response.session;
    } on FormatException {
      rethrow;
    } on AuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    log.info('Signing in $email');
    try {
      final AuthResponse response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      _session = response.session;
    } on FormatException {
      rethrow;
    } on AuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Future<void> signOut() async {
    log.info('Signing out ${_session?.user.email}');
    try {
      await _client.auth.signOut();
      log.info('${_session?.user.email} is signed out');
    } on AuthException {
      rethrow;
    } on Exception {
      rethrow;
    }
  }

  Session? getSession() {
    return _client.auth.currentSession;
  }

  bool isAuthenticated() => _session?.user != null;
}
