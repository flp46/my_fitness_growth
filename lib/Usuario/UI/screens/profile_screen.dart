import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';
import 'package:my_fitness_growth/Usuario/UI/widgets/popup_menu_profile.dart';

class ProfileScreen extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu perfil'),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
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
          // Icon(Icons.more_vert)        
        ]
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            
          }
        )
      )
    );
  }

}