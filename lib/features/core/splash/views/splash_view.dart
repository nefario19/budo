// lib/views/splash_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:supabase/supabase.dart';

import '../../repository/supabase_repository.dart';
import '../view_models/splash_view_model.dart';

class SplashView extends ViewWidget<SplashViewModel> {
  SplashView({super.key}) : super(builder: () => SplashViewModel(SupabaseRepository()));

  @override
  Widget build(BuildContext context) {
    return CommandBuilder<void, Session?>(
      command: viewModel.initializeCommand,
      whileExecuting: (BuildContext context, Session? lastValue, void param) {
        return const Center(child: CircularProgressIndicator());
      },
      onData: (BuildContext context, Session? session, void param) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacementNamed(session != null ? '/home' : '/signIn');
        });
        return const SizedBox.shrink();
      },
      onError: (BuildContext context, Object error, Session? lastValue, void param) {
        return Scaffold(body: Center(child: Text('Er is iets mis gegaan:\n$error')));
      },
    );
  }
}
