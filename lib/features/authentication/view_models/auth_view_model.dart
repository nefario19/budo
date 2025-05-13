import 'package:budo_app/features/authentication/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel {
  AuthViewModel(this._authService);
  final AuthService _authService;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;
  final _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;
  final String email = '';
  final String password = '';

  void signIn({required String email, required String password}) async =>
      await _authService.signInWithEmailAndPassword(email: email, password: password);

  void signUp({required String email, required String password}) async =>
      await _authService.signUpWithEmailAndPassword(email: email, password: password);

  void signOut() async {
    await _authService.signOut();
  }
}
