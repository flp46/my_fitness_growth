import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget{

  // final String imagenUrl = 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/two-friends-exercising-bench-press-in-gym-royalty-free-image-1585214682.jpg?crop=1.00xw:0.753xh;0,0.242xh&resize=480:*';
  // final String nombre = 'Press de Banca';
  // final String description = 'Con este ejercicio entrenas la parte central del pecho';
  final String imagenUrl;
  final String nombre;
  final String description;
  ExerciseCard({Key key, this.imagenUrl, this.nombre, this.description});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Image.network(imagenUrl),
      title: Text(nombre),
      subtitle: RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: description, 
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18
          )
        ) 
      ),
      isThreeLine: true,
      contentPadding: EdgeInsets.only(left: 0),
    );
  }

}