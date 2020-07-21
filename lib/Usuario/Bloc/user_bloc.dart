import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Ejercicio/Repository/firestore_exercise_repository.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscle_repository.dart';
import 'package:my_fitness_growth/Usuario/Repository/firebase_auth_repository.dart';
import 'package:my_fitness_growth/Usuario/Repository/firestore_my_training_repository.dart';

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
  //Con este metodo cierro la sesion que tenga iniciada en la instancia
  Future signOutUser() => _firebaseAuthRepository.signOutUserFirebase();
  //Obtener los datos del usuario actual. Retorna el FirebaseUser
  Future<String> getCurrentUser() => _firebaseAuthRepository.getCurrentUserFirebase();



  //MUSCLE BLOC
  final firestoreMusclesRepository = FirestoreMusclesRepository();

  //Stream que monitorea los musculos que hay en firebase
  Stream<QuerySnapshot> muscleList() => firestoreMusclesRepository.muscleListFirestore();
  Stream<QuerySnapshot> get muscleListStream => muscleList();
  //UI que se construye cuando identifica un cambio en el Stream de arriba
  GridView buildGridWithMuscle(List<DocumentSnapshot> muscleDocuments) => firestoreMusclesRepository.buildGridWithMuscleFirestore(muscleDocuments);


  
  //EXERCISE BLOC
  final firestoreExerciseRepository = FirestoreExerciseRepository();

  //Stream que monitorea el Stream de ejercicios segun el uid de un musculo que recibe por parametro
  Stream<QuerySnapshot> getExerciseByMuscle(String uidMuscle) => firestoreExerciseRepository.getExerciseByMuscleFirestore(uidMuscle);
  //Metodo que construye el ListView a partir de una Lista de documentos que le pasa Stream de arriba
  ListViewWithExercise buildListViewWitheExercises(List<DocumentSnapshot> exerciseDocuments) => firestoreExerciseRepository.buildListViewWitheExercises(exerciseDocuments);
  //Agrego el uid del usuario en el field userOwner del documento ejericico
  Future addUserForAnExercise(String uidExercise, uidUser) => firestoreExerciseRepository.addUserForAnExerciseFirestore(uidExercise, uidUser);



  //MYTRAINING BLOC
  final firestoreMyTrainingRepository = FirestoreMyTrainingRepository();

  Stream<QuerySnapshot> getExerciseByUser(String userUid) => firestoreMyTrainingRepository.getExerciseByUserFirestore(userUid);
  ListViewWithExercise buildListViewWitheMyTraining(List<DocumentSnapshot> exerciseDocuments) => firestoreMyTrainingRepository.buildListViewWitheMyTrainingFirestore(exerciseDocuments);
  Stream<QuerySnapshot> getExerciseForUserByMuscle(String userUid, String muscleUid) => firestoreMyTrainingRepository.getExerciseForUserByMuscleFirestore(userUid, muscleUid);

  @override
  void dispose() {
    // TODO: implement dispose
  }
  
}