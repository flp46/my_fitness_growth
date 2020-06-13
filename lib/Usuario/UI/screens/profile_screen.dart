import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu perfil'),
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
        actions: <Widget>[
          Icon(Icons.more_vert)        
        ]
      ),
      body: Center(
        child: Text('Estoy en el prefil. En el centro')
      )
    );
  }

}