import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/widgets/email_pass.dart';
import 'package:my_fitness_growth/UI/widgets/logo.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginScreen() ;
  
  
}

class _LoginScreen extends State<LoginScreen>{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return isLoginTest();
  }

  Widget isLoginTest(){
    return StreamBuilder(
      stream: userBloc.isLogin,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.hasData){
          print('hola ${snapshot} dos');
          // dataUser();

          return Container(
            color: Colors.brown,
          );
        } else {
          return registerForm();
        }
      }
    );
  }


  Widget registerForm(){
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFFfbb23c),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MainLogo(),
              LoginEmail(),
              RaisedButton(onPressed: (){
                userBloc.register('alarcon4@gmail.com', '12345678');
              }),
              RaisedButton(onPressed: (){
                userBloc.login('alarcon2@gmail.com', '12345678');
              })
            ]
          ),
        ), 
      );
    }
  
}