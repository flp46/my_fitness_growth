
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthAPI{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future registerWithCredentials(String email, String pass) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    } catch(e) {
      print(e);
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          String friendlyMessage = 'Parace que tu correo no esta bien escrito';
          return friendlyMessage;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          String friendlyMessage = 'Este correo ya esta registrado, inicia sesion';
          return friendlyMessage;          
        default:
          String friendlyMessage = 'Ups, tuvimos un error, revisa los datos nuevamente';
          return friendlyMessage;           
      }
    }
    final userData = await _auth.currentUser();
  }

  Future<AuthResult> loginWithCredentials(String email, String pass) async {
    final login = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    final userData = await _auth.currentUser();
  }
   
}