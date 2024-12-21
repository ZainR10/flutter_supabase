import 'package:flutter/material.dart';
import 'package:flutter_supabase/signup_view.dart';
import 'package:flutter_supabase/splash_view.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://cgyppphikycuzvzkubrs.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNneXBwcGhpa3ljdXp2emt1YnJzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMwMzczOTcsImV4cCI6MjA0ODYxMzM5N30.NQEx1IZCdMUD1FxzIcQRWviBcyb2uQY_XnH7kHtEywQ',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
