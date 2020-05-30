import 'package:flutter/material.dart';


class SnackbarError{

  String errorMessage;

  SnackbarError({Key key, this.errorMessage});

  showError(){
    final snackbarError = SnackBar(
      content: Text(errorMessage),
      backgroundColor: Colors.red,
    );
    return snackbarError;
  }
}