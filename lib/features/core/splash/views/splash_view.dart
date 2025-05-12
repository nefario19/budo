import 'package:budo_app/features/core/splash/view_models/splash_view_model.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashViewModel model = SplashViewModel();
  @override
  void initState() async {
    super.initState();
    await model.initialize();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero); // Give the logic some time to be processed

    if (!mounted) return;

    if (model.session != null) {
      Navigator.of(context).pushReplacementNamed('/home');
    } // TODO: hier later een else toevoegen waar je heen moet gaan als de session null is (bijvoorbeeld login page)
  }

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
