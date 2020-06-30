import 'package:my_fitness_growth/Usuario/Repository/firestore_my_training.dart';

class FirestoreMyTrainingRepository{

  final firestoreMyTrainingAPI = FirestoreMiTrainingAPI();

  Future getExerciseByUserFirestore(String userUid) => firestoreMyTrainingAPI.getExerciseByUser(userUid);

}