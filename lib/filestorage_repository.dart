import 'package:my_fitness_growth/filestorage.dart';

class FirebaseStorageRepository{

  final firebaseStorageAPI = FirebaseStorageAPI();

  Future<List<String>> getListWithUrlsFirebase() => firebaseStorageAPI.getListWithUrls();

}