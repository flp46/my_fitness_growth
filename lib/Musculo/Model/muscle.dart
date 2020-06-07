import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/Model/exercise.dart';

class Muscle{
  String uid;
  String nombre;
  String imageUrl;
  List<Exercise> ejercicios;

  Muscle({Key key, this.uid, this.nombre, this.imageUrl});

}