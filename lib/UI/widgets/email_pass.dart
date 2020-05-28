import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class LoginEmail extends StatelessWidget{

  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    double widthScreen = MediaQuery.of(context).size.width - 50;
    final emailController = TextEditingController();
    final passController = TextEditingController();

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
            controller: emailController,
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
            controller: passController,
          ),
          RaisedButton(
            onPressed: (){
              print(emailController.text);
              userBloc.register(emailController.text, passController.text);
            },
            child: Text('Form'),
          )       
        ]
      ),
    );
  }
  
}