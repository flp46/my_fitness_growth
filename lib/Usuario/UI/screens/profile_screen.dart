import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscles.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/build_future_muscle_list.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list_horizontal_notifier.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';
import 'package:my_fitness_growth/Usuario/UI/widgets/popup_menu_profile.dart';

class ProfileScreen extends StatelessWidget {
  UserBloc userBloc;
  String muscleUid;

  final notifier = MuscleListHorizontalNotifier();


  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu perfil'),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          PopupMenu(
            dataList: ['Cerrar sesion'],
            callbackList: [
              () {
                userBloc.signOutUser();
                Navigator.pop(context);
              }
            ],
          )
        ]
      ),
      body: Column(children: <Widget>[
        BuildFutureMuscleList(instantiatedNotifier: notifier),
        AnimatedBuilder(
          animation: notifier,
          builder: (_, __) => StreamBuilder(
            stream: notifier.muscleFiltred ? userBloc.getExerciseForUserByMuscle('LPiPARbq74fnHIMgNMCGhM39qch2', notifier.muscleSelected) : userBloc.getExerciseByUser('LPiPARbq74fnHIMgNMCGhM39qch2'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  print('Entre al none de MyTraining');
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.waiting:
                  print('Entre al none de MyTraining');
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  print('Entre al active de MyTraining');
                  print(snapshot.data.documents);
                  return userBloc.buildListViewWitheMyTraining(snapshot.data.documents);
                case ConnectionState.done:
                  print('Entre al done de MyTraining');
                  print(snapshot.data.documents);
                  return userBloc.buildListViewWitheMyTraining(snapshot.data.documents);
              }
            }
          ),
        ),
      ])
    );
  }
}
