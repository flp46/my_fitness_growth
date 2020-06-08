import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_card.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';


class MuscleHome extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: userBloc.muscleListStream,
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              print('Entre al none');
              return CircularProgressIndicator();
            case ConnectionState.waiting:
              print('Entre al waiting');
              return CircularProgressIndicator();
            case ConnectionState.active:
              print('Entre al active');
              return userBloc.buildGridWithMuscle(snapshot.data.documents);
            case ConnectionState.done:
              print('Entre al done');
              return userBloc.buildGridWithMuscle(snapshot.data.documents);
          } 
        }
      )
    );
  }
  
}