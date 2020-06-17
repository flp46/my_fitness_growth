import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget{

  List<VoidCallback> callbackList = [];
  List<String> dataList = [];

  PopupMenu({Key key, this.dataList, this.callbackList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PopupMenuButton(
      onSelected: prinHello,
      itemBuilder: (BuildContext context){
        return dataList.map((String opcios){
          return PopupMenuItem<String>(
            child: ListTile(
              leading: Icon(Icons.input),
              title: Text(opcios),
            ),
            value: opcios,
          );
        }).toList();
      }
    );
  }

  void prinHello(String value){
    if(value == dataList[0]){
      callbackList[0].call();
    } else {
      if (callbackList.length >= 2){
        print(callbackList.length);
        callbackList[1].call();
      } else {
        print('no tengo funcion para la opcion 2');
      }
    }
  }

}