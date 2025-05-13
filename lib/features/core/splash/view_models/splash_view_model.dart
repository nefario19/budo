// lib/view_models/splash_view_model.dart
import 'package:flutter_command/flutter_command.dart';
import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../authentication/services/auth_service.dart';
import '../../repository/supabase_repository.dart';

class SplashViewModel extends ViewModel {
  final SupabaseRepository _repo;
  late final AuthService _authService;

  late final Command<void, Session?> initializeCommand;

  SplashViewModel(SupabaseRepository repo) : _repo = repo {
    // Inject the feature-service with the repo-client
    _authService = AuthService(_repo.client);

    // Define the command
    initializeCommand = Command.createAsyncNoParam<Session?>(
      _initializeServices,
      initialValue: null,
    );
  }

  Future<Session?> _initializeServices() async {
    // 1) Initialise Supabase via the repository
    await _repo.init();
    // 2) Get the session via AuthService
    return _authService.getSession();
  }

  @override
  void initState() {
    super.initState();
    // Start initialization
    initializeCommand();
  }
}
