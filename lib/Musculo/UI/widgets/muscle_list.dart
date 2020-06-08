import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_card.dart';

class GridWithMuscle extends StatelessWidget{

  final List<MuscleCard> muscleList;

  GridWithMuscle({Key key, this.muscleList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      crossAxisCount: 2,
      children: List.from(muscleList)
    );
  }
  
}