import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_card.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';

class FirestoreExerciseAPI{

  final EXERCISE = 'Ejercicios';

  final firestore = Firestore.instance;

  Stream<QuerySnapshot> getExerciseByMuscle(String uidMuscle) => firestore.collection(EXERCISE)
  .where('musculo', isEqualTo: firestore.document('Musculos/$uidMuscle')).snapshots();

  ListViewWithExercise buildListViewWitheExercises(List<DocumentSnapshot> exerciseDocuments){
    List<Card> exerciseCardFromFirestore = List<Card>();
    print('exerciseDocuments[0]');
    exerciseDocuments.forEach((document) { 
      exerciseCardFromFirestore.add(Card(
        child: ExerciseCard(
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