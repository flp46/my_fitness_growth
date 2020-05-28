
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<AuthResult> registerWithCredentials(String email, String pass) async {
    final result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    final userData = await _auth.currentUser();
  }

  Future<AuthResult> loginWithCredentials(String email, String pass) async {
    final login = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    final userData = await _auth.currentUser();
  }
   
}