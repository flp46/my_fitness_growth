import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:my_fitness_growth/UI/screens/register_screen.dart';
import 'package:my_fitness_growth/Usuario/Bloc/user_bloc.dart';
import 'package:my_fitness_growth/Usuario/UI/screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider( 
      bloc: UserBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => RegisterScreen(),
          ProfileScreen.routeName: (context) => ProfileScreen() //RUTA CON ARGS: Declaracion de una ruta
          //nombrada a la cual le voy a pasar parametros al llamarla
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: RegisterScreen(),
      )
    ); 
  }
}

