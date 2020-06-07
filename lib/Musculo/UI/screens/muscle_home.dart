import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_card.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';


class MuscleHome extends StatelessWidget{

  final muscleList = MuscleList();

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.from(muscleList.muscleList),
        // <Widget>[
        //   MuscleCard(nombre: 'Pecho', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Espalda', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Hombro', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Biceps', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Triceps', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Pierna', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Pecho', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Espalda', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Hombro', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Biceps', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),
        //   MuscleCard(nombre: 'Triceps', imageUrl: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/perfect-male-torso-royalty-free-image-508886067-1559729968.jpg',),

        // ],
      )
    );
  }
  
}