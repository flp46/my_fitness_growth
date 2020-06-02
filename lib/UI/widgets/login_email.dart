import 'package:flutter/material.dart';
import 'package:my_fitness_growth/UI/screens/login_screen.dart';


class LoginEmail extends StatelessWidget{

    @override
    Widget build(BuildContext context) {

      // TODO: implement build
      return FlatButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreenFull())
          );
        },
        child: Text('¿Ya tienes una cuenta? Inicia Sesión',
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
          ),
        )
      );
    }
    

}