import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/global/logo.jpg'),
          fit: BoxFit.fill,
        ),
        border: Border.all(
          color: Colors.black,
          width: 4.0,
        ),
      ),
    );
  }
  
}