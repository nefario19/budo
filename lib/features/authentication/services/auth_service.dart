import 'package:loglytics/loglytics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService with Loglytics {
  late final SupabaseClient _client;
  Session? _session;
  late final Stream<AuthState> _authSubscription;

  bool loading = false;
  String? userEmail;

  void initialize() {
    log.info('I am initializing');
    _client = Supabase.instance.client;
    _authSubscription = Supabase.instance.client.auth.onAuthStateChange;
    log.info('I am done initializing');
  }

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

  bool isAuthenticated() => _session?.user != null;
}
