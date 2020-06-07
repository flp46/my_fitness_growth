import 'package:flutter/material.dart';

class MuscleCard extends StatelessWidget{

  String imageUrl;
  String nombre;

  MuscleCard({Key key, this.nombre, this.imageUrl});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width; 
    double screenHeight = MediaQuery.of(context).size.height;

    // TODO: implement build
    return Card(
      color: Colors.amber,
      elevation: 10.0,
      shadowColor: Colors.black,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover
          )
        ),
        child: Text(
          nombre,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 23
          ),
        )
      )
    );
  }
  
}