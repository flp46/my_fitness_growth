import 'package:flutter/material.dart';
import 'package:my_fitness_growth/Usuario/UI/widgets/popup_menu_profile.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu perfil'),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          PopupMenu(
            dataList: ['hola', 'como'],
            callbackList: [
              () => print('hola entre bien'), 
              () => print('Entre fue re bien')
            ],
          )
          // Icon(Icons.more_vert)        
        ]
      ),
      body: Center(
        child: Text('Estoy en el prefil. En el centro')
      )
    );
  }

}