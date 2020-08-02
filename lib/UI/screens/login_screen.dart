import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/widgets/facebook_button.dart';
import 'package:my_fitness_growth/UI/widgets/google_button.dart';
import 'package:my_fitness_growth/UI/widgets/logo.dart';
import 'package:my_fitness_growth/UI/widgets/register_email.dart';
import 'package:my_fitness_growth/UI/widgets/snackbar_error.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';
import 'package:my_fitness_growth/test_screen.dart';

class LoginScreenFull extends StatelessWidget{

  UserBloc userBloc;
  SnackbarError errorMessage = SnackbarError();
  final showHide = ShowHidePass();
  final emailController2 = TextEditingController();
  final passController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {


    userBloc = BlocProvider.of(context);
    double widthScreen = MediaQuery.of(context).size.width;


    // TODO: implement build
    return AnimatedBuilder(
      animation: showHide,
      builder: (_, __) => Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
          backgroundColor: Color(0xFFfbb23c)
        ),
        body: Builder(builder: (context) => Container(
          alignment: Alignment.center,
          color: Color(0xFFfbb23c),
          width: widthScreen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: widthScreen - 50,
                child: Column(
                  children:<Widget>[
                    MainLogo(),
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
                      controller: emailController2,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.white70
                            ),
                            labelText: 'Contraseña',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white70)
                            ),
                            // suffixIcon: Icon(Icons.visibility)
                          ),
                          keyboardType: TextInputType.text,
                          controller: passController2,
                          obscureText: showHide.binary,
                        ),
                        IconButton(
                          icon: showHide.binary ? Icon(Icons.visibility) : Icon(Icons.visibility_off), 
                          onPressed: (){
                            showHide.changeBinaryEye();
                          }
                        )
                      ],
                    ), 
                    Container(
                      height: 20
                    ), 
                    RaisedButton(
                      color: Colors.white,
                      onPressed: (){
                        if (showHide.isPressed == true){
                          showHide.changeBinaryButton();
                          userBloc.login(emailController2.text.trim(), passController2.text).then((value){
                            // SI SE PRESENTA UN ERROR EN EL REGISTRO, EN EL VALUE VIENE EL MENSAJE DE ERROR REPORTADO POR FIREBASE Y LO MUESTRO EN LA UI CON UN SNACKBAR QUE RECIBE EL MSJ DE ERROR
                            if (value != null){
                              Scaffold.of(context).showSnackBar(SnackbarError(errorMessage: value).showError());
                              showHide.changeBinaryButton();
                            } else {
                              Navigator.pop(context);
                            }
                            //PENDIENTE: QUE PASA SI EL USUARIO CIERRA SESION? EL BOTON DE REGISTRARME VUELVE A ESTAR ACTIVO?
                          });
                        } else {
                          print('No tan rapidoooooo');
                        }
                      },
                      child: showHide.isPressed ? Text('Iniciar Sesion') : CircularProgressIndicator(),
                    ),
                    FacebookButton(),
                    GoogleButton(),
                    RaisedButton(
                      child: Text('Test Screen'),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) => TestScreen()));
                      }
                    )       
                  ],
                )
              ),
            ]
          ),
        )
      )
      )
    );
  }
}
  
