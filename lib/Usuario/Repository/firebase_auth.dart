
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _authGoogle = GoogleSignIn();
  final FacebookLogin _authFacebook = FacebookLogin();

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

  Future loginWithCredentials(String email, String pass) async {
    try {
    final login = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch(e) {
      print(e);
      switch (e.code) {
        case 'ERROR_INVALID_EMAIL':
          String friendlyMessage = 'Parace que tu correo no esta bien escrito';
          return friendlyMessage;
        case 'ERROR_EMAIL_ALREADY_IN_USE':
          String friendlyMessage = 'Este correo ya esta registrado, inicia sesion';
          return friendlyMessage; 
        case 'ERROR_USER_NOT_FOUND':
          String friendlyMessage = 'No tenemos una cuenta con este correo, ¡Registrate!';
          return friendlyMessage; 
        case 'ERROR_WRONG_PASSWORD':
          String friendlyMessage = 'La contraseña es incorrecta, o creaste tu cuenta con Facebook o Google';
          return friendlyMessage;                   
        default:
          String friendlyMessage = 'Ups, tuvimos un error, revisa los datos nuevamente';
          return friendlyMessage;           
      }
    }
    final userData = await _auth.currentUser();
  }

  Future<FirebaseUser> loginWithGoogle() async {
    try{
      final GoogleSignInAccount googleUser = await _authGoogle.signIn().catchError((onError) => print('falle'));
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, 
        accessToken: googleAuth.accessToken
      );

      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } catch(e){
      //PENDIENTE: DART NO LOGRA ENTRAR A ESTE CATCH, REVISAR HILO OFICIAL DE FLUTTER https://github.com/flutter/flutter/issues/44431
      print(e.code);
    }
  }

  Future loginWithFacebook() async {
    final facebook = await _authFacebook.logInWithReadPermissions(['email']);

    switch(facebook.status){
      case FacebookLoginStatus.loggedIn:
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: facebook.accessToken.token
        );
        final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
        print(user.displayName);
        return user;
      case FacebookLoginStatus.cancelledByUser:
        print('cancelado por el usuario');
        String friendlyMessage = 'Parece que no terminaste el proceso de registro, vuelve a intentarlo';
        return friendlyMessage;
      case FacebookLoginStatus.error:
        print('hubo un error');
        String friendlyMessage = 'Ups, tuvimos un error, intenta nuevamente';
        return friendlyMessage;
    }
  }


   
}
