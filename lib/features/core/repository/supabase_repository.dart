// lib/repositories/supabase_repository.dart
import 'package:loglytics/loglytics.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepository with Loglytics {
  SupabaseClient? _client;

  Future<void> init() async {
    log.info('I am initializing');
    await Supabase.initialize(
      url: 'https://rkxshluwonfyaviyvzyb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJreHNobHV3b25meWF2aXl2enliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0NDE2MzAsImV4cCI6MjA2MjAxNzYzMH0.gWM5YRLMZASobmAUMwAz5kfyDg5dxO1f-sOsvr1o6Cs',
    );
    _client = Supabase.instance.client;
    log.info('I am done initializing');
  }

  SupabaseClient get client {
    if (_client == null) {
      throw StateError('SupabaseRepository not initialized');
    }
    return _client!;
  }
}
