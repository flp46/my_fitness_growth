import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_fitness_growth/Ejercicio/Repository/firestore_exercise.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_list.dart';

class FirestoreExerciseRepository{

  final firestoreExerciseAPI = FirestoreExerciseAPI();

  Stream<QuerySnapshot> getExerciseByMuscleFirestore(String uidMuscle) => firestoreExerciseAPI.getExerciseByMuscle(uidMuscle);
  ListViewWithExercise buildListViewWitheExercises(List<DocumentSnapshot> exerciseDocuments) => firestoreExerciseAPI.buildListViewWitheExercises(exerciseDocuments);

  Future addUserForAnExerciseFirestore(String uidExercise, uidUser) => firestoreExerciseAPI.addUserForAnExercise(uidExercise, uidUser);


}