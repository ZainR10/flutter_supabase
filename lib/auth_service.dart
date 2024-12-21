import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  //sign up funtion
  Future<String?> signup(String email, String password) async {
    try {
      final response =
          await supabase.auth.signUp(email: email, password: password);
      if (response.user != null) {
        return null; //success
      }
      return 'An unknown error accured';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Error:$e';
    }
  }

// login function
  Future<String?> login(String email, String password) async {
    try {
      final response = await supabase.auth
          .signInWithPassword(email: email, password: password);
      if (response.session != null) {
        return null; //success
      }
      return 'An unknown error accured';
    } on AuthException catch (e) {
      return e.message;
    } catch (e) {
      return 'Error: $e';
    }
  }

  //Logout function
  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  //Auth State listner
  void listenToAuthChanges() {
    supabase.auth.onAuthStateChange.listen((event) {
      print('Auth state changed $event');
    });
  }
}
