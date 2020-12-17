import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInAnon() async {
    try {
      UserCredential userCredential = await _auth.signInAnonymously();
      print(userCredential);
    } catch (e) {
      print(e);
    }
  }
}