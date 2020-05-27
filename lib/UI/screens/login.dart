import 'package:flutter/material.dart';
import 'package:my_fitness_growth/UI/widgets/logo.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFfbb23c),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MainLogo()
          ]
        ),
      ), 
    );
  }
  
}