import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Musculo/Repository/firestore_muscles.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list_horizontal_notifier.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class BuildFutureMuscleList extends StatelessWidget {

  MuscleListHorizontalNotifier instantiatedNotifier;

  BuildFutureMuscleList({Key key, this.instantiatedNotifier});

  

  @override
  Widget build(BuildContext context) {

    UserBloc userBloc = BlocProvider.of(context);

    // TODO: implement build
    return FutureBuilder<List<DocumentSnapshot>>(
      future: userBloc.getMuscleList(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return CircularProgressIndicator();
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          case ConnectionState.active:
            return drawListView(snapshot, instantiatedNotifier);
          case ConnectionState.done:
            return drawListView(snapshot, instantiatedNotifier);
        }
      },
    );
  }

  Widget drawListView(AsyncSnapshot<List<DocumentSnapshot>> snapshot, MuscleListHorizontalNotifier instantiatedNotifier) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          DocumentSnapshot document = snapshot.data[index];
          return Container(
            width: 500,
            child: RaisedButton(
              child: Text(document.data['nombre']),
              onPressed: () {
                instantiatedNotifier.muscleWithFilter(document.documentID);
              },
            ),
          );
        }
      ),
    );
  }
}