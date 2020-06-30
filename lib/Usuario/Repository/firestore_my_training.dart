import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMiTrainingAPI{

  final firestore = Firestore.instance;
  final EXERCISE = 'Ejercicios';

  Future getExerciseByUser(String userUid){
    final exercise = firestore.collection(EXERCISE)
    .where('userOwner', arrayContains: userUid).snapshots();

    exercise.forEach((document) {
      final ejercicio = document.documents;
      ejercicio.forEach((ahora) { 
        print(ahora.documentID);
      });
     });

  }

}