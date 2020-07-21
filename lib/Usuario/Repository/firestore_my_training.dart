import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_card.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';

class FirestoreMiTrainingAPI{

  final firestore = Firestore.instance;
  final EXERCISE = 'Ejercicios';

  //Stream que obtiene todos los ejercicio sin importar el musculo del usuario
  Stream<QuerySnapshot> getExerciseByUser(String userUid) => firestore.collection(EXERCISE)
    .where('userOwner', arrayContains: userUid).snapshots();

  //Stream que obtiene los ejercicios del usuario, segun el musculo que escoja
  Stream<QuerySnapshot> getExerciseForUserByMuscle(String userUid, String muscleUid) => firestore.collection(EXERCISE)
    .where('userOwner', arrayContains: userUid).where('musculo', isEqualTo: firestore.document('Musculos/$muscleUid'))
    .snapshots();
  

  //   exercise.forEach((document) {
  //     final ejercicio = document.documents;
  //     ejercicio.forEach((ahora) { 
  //       print(ahora.documentID);
  //     });
  //    });

  // }

  //Construye el ListView con los ejercicios que tiene como favorito el usuario
  ListViewWithExercise buildListViewWitheMyTraining(List<DocumentSnapshot> exerciseDocuments){
    List<Card> exerciseCardFromFirestore = List<Card>();
    print('exerciseDocuments[0]');
    exerciseDocuments.forEach((document) { 
      exerciseCardFromFirestore.add(Card(
        child: ExerciseCard(
          uid: document.documentID,
          imagenUrl: document.data['imagenUrl'],
          nombre: document.data['nombre'],
          description: document.data['descripcion'],
          tips: document.data['tips']
        ),
      ));
    });
  
    print('exerciseCardFromFirestore[0]');

    return ListViewWithExercise(exerciseList: exerciseCardFromFirestore,);

  }

}