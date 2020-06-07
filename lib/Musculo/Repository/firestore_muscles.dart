import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreMusclesAPI {

  final String MUSCULOS = 'Musculos';

  final firestore = Firestore.instance;


  Future getMusclesList() async{
    CollectionReference muscleList = await firestore.collection(MUSCULOS);
    print(muscleList.id);
    QuerySnapshot muscleData = await muscleList.getDocuments();
    print(muscleData.documents);

    muscleData.documents.forEach((documet){
      String idDocument = documet.documentID;
      String documentData = documet.data['nombre'];
      print(documentData);
      print(documet.documentID);
      print(documet);
     });

  }

}