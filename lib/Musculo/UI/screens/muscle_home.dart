import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';


class MuscleHome extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);


    // TODO: implement build
    return Container(
      color: Colors.amber,
      child: RaisedButton(
        onPressed: (){
          userBloc.getMusclesList();
        },
        child: Text('hola'),
      )
    );
  }
  
}