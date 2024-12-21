import 'package:flutter/material.dart';
import 'package:flutter_supabase/home_view.dart';
import 'package:flutter_supabase/login_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkUserSession();
  }

  Future<void> _checkUserSession() async {
    final session = Supabase.instance.client.auth.currentSession;
    await Future.delayed(const Duration(seconds: 4));

    //Navigate based on session state
    if (session != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomeView()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => LoginView()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Check User Status'),
      ),
    );
  }
}
