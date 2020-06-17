import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fitness_growth/Usuario/Repository/firebase_auth.dart';

class FirebaseAuthRepository{

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future registerFirebase(email, pass) => _firebaseAuthAPI.registerWithCredentials(email, pass); 
  Future loginFirebase(email, pass) => _firebaseAuthAPI.loginWithCredentials(email, pass); 
  Future loginWithGoogleFirebase() =>_firebaseAuthAPI.loginWithGoogle();
  Future loginWithFacebookFirebase() => _firebaseAuthAPI.loginWithFacebook();
  Future signOutUserFirebase() => _firebaseAuthAPI.signOutUser();
}