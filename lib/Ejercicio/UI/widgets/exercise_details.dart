import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Ejercicio/UI/widgets/exercise_fab_notifier.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';


class ExerciseDetails extends StatelessWidget{

  String uid;
  String imageUrl;
  String name;
  String description;
  List<dynamic> tips;

  ExerciseDetails({Key key, this. uid, this.imageUrl, this.name, this.description, this.tips});

  UserBloc userBloc;
  final controlButton = ControlIconFAB();

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width; 
    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
        title: Text('Detalle del ejercicio')
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          drawImage(imageUrl),
          drawTitle(name),
          drawDescription(description),
          drawTips(tips, screenWidth),
          Center(
            child: AnimatedBuilder(
            animation: controlButton,
            builder: (_, __) => FloatingActionButton(
              child: controlButton.isFaved ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: () async {
                controlButton.clickedButton();
                final String userUid =  await userBloc.getCurrentUser();
                userBloc.addUserForAnExercise(uid, userUid);
              }),
            ),
          ),
        ]
      ),
    );
  }

  Widget drawImage(String imageUrl){
    print(tips[1]);
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl)
        )
      ) ,
    );
  }

  Widget drawTitle(String name){
    return Container(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 32 ,
        ),
      )
    );
  }

  Widget drawDescription(String description){
    return Container(
      child: Text(
        description,
        style: TextStyle(
          fontSize: 20
        ),
      )
    );
  }

  Widget drawTips(List<dynamic> tips, double tileSize){
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tips.length,
        itemBuilder: (context, index){
          return Container(
            width: tileSize - 40, 
            child: ListTile(
              subtitle: Text('${tips[index]}'),
              isThreeLine: true,
            )
          );
        }
      )
    );
  }

}