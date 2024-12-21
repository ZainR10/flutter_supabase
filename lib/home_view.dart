import 'package:flutter/material.dart';
import 'package:flutter_supabase/auth_service.dart';
import 'package:flutter_supabase/login_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final authservice = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Welcome'),
          ),
          InkWell(
              onTap: () async {
                await authservice.logout();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                    (route) => false);
              },
              child: const Icon(Icons.logout))
        ],
      ),
    );
  }
}
