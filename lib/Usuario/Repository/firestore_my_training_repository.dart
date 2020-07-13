import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';
import 'package:my_fitness_growth/Usuario/Repository/firestore_my_training.dart';

class FirestoreMyTrainingRepository{

  final firestoreMyTrainingAPI = FirestoreMiTrainingAPI();

  Stream<QuerySnapshot> getExerciseByUserFirestore(String userUid) => firestoreMyTrainingAPI.getExerciseByUser(userUid);
  ListViewWithExercise buildListViewWitheMyTrainingFirestore(List<DocumentSnapshot> exerciseDocuments) => firestoreMyTrainingAPI.buildListViewWitheMyTraining(exerciseDocuments);

}