import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/widgets/email_pass.dart';
import 'package:my_fitness_growth/UI/widgets/facebook_button.dart';
import 'package:my_fitness_growth/UI/widgets/google_button.dart';
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
              FacebookButton(),
              GoogleButton()
              // RaisedButton(
              //   onPressed: (){
              //     userBloc.loginWithGoogle().then((FirebaseUser user){
              //       print(user);
              //     }).catchError((onError){
              //       print('ups falle');
              //     });
              //   },
              //   child: Text('Google') 
              // )
            ]
          ),
        ), 
      );
    }
  
}