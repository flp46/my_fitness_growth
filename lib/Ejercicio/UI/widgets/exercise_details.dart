import 'package:flutter/material.dart';

class ExerciseDetails extends StatelessWidget{

  String imageUrl;
  String name;
  String description;
  List<dynamic> tips;

  ExerciseDetails({Key key, this.imageUrl, this.name, this.description, this.tips});


  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width; 

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_arrow_left) , onPressed: () => Navigator.pop(context)),
        title: Text('Detalle del ejercicio')
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          drawImage(imageUrl),
          drawTitle(name),
          drawDescription(description),
          // ExerciseTipsList(),
          drawTips(tips, screenWidth)
        ]
      ),
    );
  }

  Widget drawImage(String imageUrl){
    print(tips[1]);
    return Container(
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl)
        )
      ) ,
    );
  }

  Widget drawTitle(String name){
    return Container(
      child: Text(
        name,
        style: TextStyle(
          fontSize: 32 ,
        ),
      )
    );
  }

  Widget drawDescription(String description){
    return Container(
      child: Text(
        description,
        style: TextStyle(
          fontSize: 20
        ),
      )
    );
  }

  Widget drawTips(List<dynamic> tips, double tileSize){
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tips.length,
        itemBuilder: (context, index){
          return Container(
            width: tileSize - 40, 
            child: ListTile(
              subtitle: Text('${tips[index]}'),
              isThreeLine: true,
            )
          );
        }
      )
    );
  }

}