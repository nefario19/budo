import 'package:mvvm_plus/mvvm_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashViewModel extends ViewModel {
  late final supabase = Supabase.instance;

  late final session = createProperty<Session?>(null);

  Future<void> _initialize() async {
    // 1c. Initialiseer Supabase (kan ook in main() gedaan worden)
    await Supabase.initialize(
      url: 'https://rkxshluwonfyaviyvzyb.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJreHNobHV3b25meWF2aXl2enliIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY0NDE2MzAsImV4cCI6MjA2MjAxNzYzMH0.gWM5YRLMZASobmAUMwAz5kfyDg5dxO1f-sOsvr1o6Cs',
    );

    session.value = supabase.client.auth.currentSession;
    buildView();
  }
}
