
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscles.dart';

class FirestoreMusclesRepository{

  final firestoreMusclesAPI = FirestoreMusclesAPI();

  Future getMusclesListFirestore() => firestoreMusclesAPI.getMusclesList();
  
}