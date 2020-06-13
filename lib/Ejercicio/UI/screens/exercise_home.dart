import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class ExerciseHome extends StatelessWidget{

  UserBloc userBloc;
  String uidMuscle;

  ExerciseHome({Key key, this.uidMuscle});

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
        title: Text('Lista de ejercicios')
      ),
      body: StreamBuilder(
        stream: userBloc.getExerciseByMuscle(uidMuscle),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              print('Entre al none');
              return Center(child: CircularProgressIndicator());
            case ConnectionState.waiting:
              print('Entre al waiting');
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              print('Entre al active de exercises');
              print(snapshot.data.documents);
              return userBloc.buildListViewWitheExercises(snapshot.data.documents);
            case ConnectionState.done:
              print('Entre al active');
              return userBloc.buildListViewWitheExercises(snapshot.data.documents);
          }
        }
      )
    );
  }
  
}