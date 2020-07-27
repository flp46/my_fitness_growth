import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_card.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list.dart';

class FirestoreMusclesAPI {

  final String MUSCULOS = 'Musculos';

  final firestore = Firestore.instance;

  Stream<QuerySnapshot> muscleList() => firestore.collection(MUSCULOS).snapshots();

  GridView buildGridWithMuscle(List<DocumentSnapshot> muscleDocuments){
    List<MuscleCard> muscleCardFromFirestore = List<MuscleCard>();

    muscleDocuments.forEach((document) {
      muscleCardFromFirestore.add(MuscleCard(
        imageUrl: document.data['imagenUrl'],
        nombre: document.data['nombre'],
        uidMuscle: document.documentID,
      ));
    });

    return GridView.count(
      crossAxisCount: 2,
      children: List.from(muscleCardFromFirestore)
    );   
  }

  Future<List<DocumentSnapshot>> getMuscleList() async {
    List<DocumentSnapshot> document = List<DocumentSnapshot>();

    final muscleDocuments = await firestore.collection(MUSCULOS).getDocuments()
    .then((value) => {
      value.documents.forEach((element) {
        document.add(element);
      })
    });

    return document;

  }
}