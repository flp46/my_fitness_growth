
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscles.dart';

class FirestoreMusclesRepository{

  final firestoreMusclesAPI = FirestoreMusclesAPI();

  // Future getMusclesListFirestore() => firestoreMusclesAPI.getMusclesList();

  Stream<QuerySnapshot> muscleListFirestore() => firestoreMusclesAPI.muscleList();

  GridView buildGridWithMuscleFirestore(List<DocumentSnapshot> muscleDocuments) => firestoreMusclesAPI.buildGridWithMuscle(muscleDocuments);

  Future<List<DocumentSnapshot>> getMuscleListFirestore() =>firestoreMusclesAPI.getMuscleList();

}