import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreExerciseAPI{

  final EXERCISE = 'Ejercicios';

  final firestore = Firestore.instance;

  Stream<QuerySnapshot> getExerciseByMuscle(String uidMuscle) => firestore.collection(EXERCISE)
  .where('musculo', isEqualTo: firestore.document('Ejercicios/$uidMuscle')).snapshots();

}