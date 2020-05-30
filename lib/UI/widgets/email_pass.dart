import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/widgets/snackbar_error.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class ShowHidePass extends ChangeNotifier{

  bool binary = true;
  bool isPressed = true;

  //CONTROLA LA VISIBILIDAD DE LA CONTRASEÑA
  void changeBinaryEye(){
    binary = !binary;
    notifyListeners();
  }

  //CONTROLA SI SE HACE CLICK MUY RAPIDO EN EL BOTON DE REGISTRARME
  void changeBinaryButton(){
    isPressed = !isPressed;
    notifyListeners();
  }

}



class LoginEmail extends StatelessWidget{

  UserBloc userBloc;
  SnackbarError errorMessage = SnackbarError();
  final showHide = ShowHidePass();

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);

    double widthScreen = MediaQuery.of(context).size.width - 50;
    final emailController = TextEditingController();
    final passController = TextEditingController();

    // TODO: implement build
    return AnimatedBuilder(
      animation: showHide,
      builder: (_, __) => Container(
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
                    controller: passController,
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
              RaisedButton(
                onPressed: (){
                  if (showHide.isPressed == true){
                    showHide.changeBinaryButton();
                    userBloc.register(emailController.text.trim(), passController.text).then((value){
                      // SI SE PRESENTA UN ERROR EN EL REGISTRO, EN EL VALUE VIENE EL MENSAJE DE ERROR REPORTADO POR FIREBASE Y LO MUESTRO EN LA UI CON UN SNACKBAR QUE RECIBE EL MSJ DE ERROR
                      if (value != null){
                        Scaffold.of(context).showSnackBar(SnackbarError(errorMessage: value).showError());
                        showHide.changeBinaryButton();
                      }
                      //PENDIENTE: QUE PASA SI EL USUARIO CIERRA SESION? EL BOTON DE REGISTRARME VUELVE A ESTAR ACTIVO?
                    });
                  } else {
                    print('No tan rapidoooooo');
                  }
                },
                child: showHide.isPressed ? Text('Registrarme') : CircularProgressIndicator(),
              )       
            ]
          ),
        )
    );
  }
  
}