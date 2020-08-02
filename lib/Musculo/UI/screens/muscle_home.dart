import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_card.dart';
import 'package:my_fitness_growth/Musculo/UI/widgets/muscle_list.dart';
import 'package:my_fitness_growth/UI/widgets/slider_promos.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';
import 'package:my_fitness_growth/Usuario/UI/screens/profile_screen.dart';


class MuscleHome extends StatelessWidget{

  String userUid; //RUTA CON ARGS: Parametro que le voy a pasar a la ruta nombrada que me lo recibe
  MuscleHome({Key key, this.userUid });
  

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);


    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Musculos')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed: () async {
              userUid = await userBloc.getCurrentUser();
              Navigator.pushNamed(
                context,
                ProfileScreen.routeName, //RUTA CON ARGS: Forma de llamar a la ruta nombrada que recibe parametros 
                arguments: MuscleHome(userUid: userUid)); //RUTA CON ARGS: Los parametros vienen de una variable del widget que llama a la ruta nombrada con parametro
            }
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: userBloc.getListWithUrls(),
            builder: (context, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return CircularProgressIndicator();
                case ConnectionState.waiting:
                  return CircularProgressIndicator();
                case ConnectionState.active:
                  return SliderPromos(imageLinks: snapshot.data);
                case ConnectionState.done:
                  return SliderPromos(imageLinks: snapshot.data);
              }
            }
          ),
          Container(height: 10),
          Expanded(
            child: StreamBuilder(
              stream: userBloc.muscleListStream,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                switch (snapshot.connectionState){
                  case ConnectionState.none:
                    print('Entre al none');
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.waiting:
                    print('Entre al waiting');
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    print('Entre al active');
                    return userBloc.buildGridWithMuscle(snapshot.data.documents);
                  case ConnectionState.done:
                    print('Entre al done');
                    return userBloc.buildGridWithMuscle(snapshot.data.documents);
                } 
              }
            ),
          ),
        ],
      )
    );
  }
  
}