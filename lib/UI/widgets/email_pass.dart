import 'package:flutter/material.dart';

class LoginEmail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double widthScreen = MediaQuery.of(context).size.width - 50;

    // TODO: implement build
    return Container(
      width: widthScreen,
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white70
              ),
              hintText: 'sasha@hotmail.com',
              labelText: 'Correo',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70)
              )
              
            ),
            keyboardType: TextInputType.emailAddress,
          ),  
          TextField(
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.white70
              ),
              labelText: 'Contraseña',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70)
              )
              
            ),
            keyboardType: TextInputType.text,
          )        
        ]
      ),
    );
  }
  
}