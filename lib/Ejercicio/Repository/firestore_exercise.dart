import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_card.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';

class FirestoreExerciseAPI{

  final EXERCISE = 'Ejercicios';

  final firestore = Firestore.instance;

  //Stream que monitorea TODOS los ejercicios
  Stream<QuerySnapshot> getExerciseByMuscle(String uidMuscle) => firestore.collection(EXERCISE)
  .where('musculo', isEqualTo: firestore.document('Musculos/$uidMuscle')).snapshots();

  //Construye el ListView con los ejercicios que corresponden al musculo
  ListViewWithExercise buildListViewWitheExercises(List<DocumentSnapshot> exerciseDocuments){
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

  Future addUserForAnExercise(String uidExercise,String uidUser){
    print('sirvio el click');
    firestore.collection(EXERCISE).document(uidExercise)
    .updateData({
      'userOwner': FieldValue.arrayUnion([uidUser]),
    });
    print('termine el add');
  }

}