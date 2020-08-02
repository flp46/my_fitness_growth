import 'package:flutter/material.dart';
import 'package:my_fitness_growth/UI/widgets/slider_promos.dart';
import 'package:my_fitness_growth/filestorage.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final borrar = FirebaseStorageAPI();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Pantalla de prueba'),),
      body: FutureBuilder(
        future: borrar.getListWithUrls(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            case ConnectionState.active:
              return SliderPromos(imageLinks: snapshot.data);
            case ConnectionState.done:
              return SliderPromos(imageLinks: snapshot.data);
          }
        }
      ),
    );
  }
}
