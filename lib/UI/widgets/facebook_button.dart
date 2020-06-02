import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/widgets/snackbar_error.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';

class ControlButton extends ChangeNotifier{

  bool isPressed = true;

  //CONTROLA SI SE HACE CLICK MUY RAPIDO EN EL BOTON DE REGISTRARME
  void changeBinaryButton(){
    isPressed = !isPressed;
    notifyListeners();
  }

}





class FacebookButton extends StatelessWidget{

  UserBloc userBloc;
  final controlButton = ControlButton();

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return RaisedButton(
      color: Color(0xFF3b5998),
      textColor: Colors.white,
      child: Text('Continua con Facebook'),
      onPressed: (){
        if (controlButton.isPressed == true){
          controlButton.changeBinaryButton();
          userBloc.loginWithFacebook().then((value){
            if (value != null){
              Scaffold.of(context).showSnackBar(SnackbarError(errorMessage: value).showError());
              controlButton.changeBinaryButton();
            } else {
              print('No tan rapido');
            }
          });
        }
      },
    );
  }

}