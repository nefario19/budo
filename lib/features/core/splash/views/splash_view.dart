import 'package:budo_app/features/core/splash/view_models/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:supabase/supabase.dart';

class SplashView extends ViewWidget<SplashViewModel> {
  SplashView({Key? key}) : super(key: key, builder: () => SplashViewModel());

  void init() {
    viewModel.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Session?>(
      valueListenable: viewModel.session,
      builder: (context, session, _) {
        if (session == null) {
          return Scaffold(body: const Center(child: CircularProgressIndicator()));
        } else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed('/home');
          });
          return const SizedBox.shrink();
        }
      },
    );
  }
}
