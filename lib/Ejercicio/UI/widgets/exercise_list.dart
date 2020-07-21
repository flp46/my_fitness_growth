import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_card.dart';

class ListViewWithExercise extends StatelessWidget{

  final List exerciseList;

  ListViewWithExercise({Key key, this.exerciseList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      shrinkWrap: true,
      children: List.from(exerciseList),
    );
  }
  
}