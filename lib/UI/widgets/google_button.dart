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



class GoogleButton extends StatelessWidget{

  UserBloc userBloc;
  final controlButton = ControlButton();

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of(context);

    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF4285F4),
      child: FaIcon(FontAwesomeIcons.google),
      onPressed: (){
        if (controlButton.isPressed == true){
          controlButton.changeBinaryButton();
          userBloc.loginWithGoogle().then((value){
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