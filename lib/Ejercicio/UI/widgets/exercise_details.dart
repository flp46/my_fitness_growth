import 'package:flutter/material.dart';

class ExerciseDetails extends StatelessWidget{

  // String imageUrl = 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/two-friends-exercising-bench-press-in-gym-royalty-free-image-1585214682.jpg?crop=1.00xw:0.753xh;0,0.242xh&resize=480:*';
  // String name = 'Press de Banca';
  // String description = 'Excelente ejercicio';

  String imageUrl;
  String name;
  String description;

  ExerciseDetails({Key key, this.imageUrl, this.name, this.description});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Detalle del ejercicio')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          drawImage(imageUrl),
          drawTitle(name),
          drawDescription(description)
        ]
      ),
    );
  }

  Widget drawImage(String imageUrl){
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl)
        )
      ) ,
    );
  }

  Widget drawTitle(String name){
    return Container(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 32 ,
        ),
      )
    );
  }

  Widget drawDescription(String description){
    return Container(
      child: Text(
        description,
        style: TextStyle(
          fontSize: 20
        ),
      )
    );
  }

}