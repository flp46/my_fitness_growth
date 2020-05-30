import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_fitness_growth/Usuario/Repository/firebase_auth.dart';

class FirebaseAuthRepository{

  final _firebaseAuthAPI = FirebaseAuthAPI();

  Future registerFirebase(email, pass) => _firebaseAuthAPI.registerWithCredentials(email, pass); 
  Future<AuthResult> loginFirebase(email, pass) => _firebaseAuthAPI.loginWithCredentials(email, pass); 

}