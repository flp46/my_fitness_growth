import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  final StorageReference storage = FirebaseStorage.instance.ref();
  List<String> imagesLinks = [];

  //Obtiene el link de descarga cada una de las fotos del filestorage y las agregar a una lista
  Future<List<String>> getListWithUrls() async {
    for (int i = 1; i <= 3; i++) {
      var link = await storage.child('/$i.jpg').getDownloadURL();
      imagesLinks.add(link);
    }

    return imagesLinks;
  }

}
