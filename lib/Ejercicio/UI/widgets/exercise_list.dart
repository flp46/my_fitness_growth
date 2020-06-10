import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_card.dart';

class ListViewWithExercise extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de ejercicios')
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ExerciseCard(),
          ),
        ]
      ),
    );
  }
  
}