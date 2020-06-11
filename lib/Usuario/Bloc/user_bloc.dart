import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Ejercicio/Repository/firestore_exercise_repository.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscle_repository.dart';
import 'package:my_fitness_growth/Usuario/Repository/firebase_auth_repository.dart';

class UserBloc implements Bloc{

  // USER BLOC
  final _firebaseAuthRepository = FirebaseAuthRepository();

  //Con este metodo registro con email y contraseña
  Future register(email, pass) => _firebaseAuthRepository.registerFirebase(email, pass);
  //Con este metodo logeo con email y contraseña
  Future login(email, pass) => _firebaseAuthRepository.loginFirebase(email, pass);
  //Con este metodo logeo con la cuenta de google
  Future loginWithGoogle() => _firebaseAuthRepository.loginWithGoogleFirebase();
  //Con este metodo logeo con la cuenta de facebook
  Future loginWithFacebook() => _firebaseAuthRepository.loginWithFacebookFirebase();
  //Creo el observable que va a monitorear el cambio de estado
  Stream<FirebaseUser> getStatus = FirebaseAuth.instance.onAuthStateChanged;
  //Consulto el estado de ese observable
  Stream<FirebaseUser> get isLogin => getStatus;



  //MUSCLE BLOC
  final firestoreMusclesRepository = FirestoreMusclesRepository();

  //Stream que monitorea los musculos que hay en firebase
  Stream<QuerySnapshot> muscleList() => firestoreMusclesRepository.muscleListFirestore();
  Stream<QuerySnapshot> get muscleListStream => muscleList();
  //UI que se construye cuando identifica un cambio en el Stream de arriba
  GridView buildGridWithMuscle(List<DocumentSnapshot> muscleDocuments) => firestoreMusclesRepository.buildGridWithMuscleFirestore(muscleDocuments);


  //EXERCISE BLOC
  final firestoreExerciseRepository = FirestoreExerciseRepository();

  Stream<QuerySnapshot> getExerciseByMuscle(String uidMuscle) => firestoreExerciseRepository.getExerciseByMuscleFirestore(uidMuscle);
  // Stream<QuerySnapshot> get getExerciseByMuscleStream => getExerciseByMuscle(uidMuscle);
  ListViewWithExercise buildListViewWitheExercises(List<DocumentSnapshot> exerciseDocuments) => firestoreExerciseRepository.buildListViewWitheExercises(exerciseDocuments);

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}