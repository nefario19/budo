import 'package:supabase_flutter/supabase_flutter.dart';

class SplashViewModel {
  late final Supabase supabase;
  late final Session? _session;
  Session? get session => _session;

  Future<void> initialize() async {
    await Supabase.initialize(
      url: 'https://rkxshluwonfyaviyvzyb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJreHNobHV3b25meWF2aXl2enliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0NDE2MzAsImV4cCI6MjA2MjAxNzYzMH0.gWM5YRLMZASobmAUMwAz5kfyDg5dxO1f-sOsvr1o6Cs',
    );

    _session = supabase.client.auth.currentSession;
  }
}
