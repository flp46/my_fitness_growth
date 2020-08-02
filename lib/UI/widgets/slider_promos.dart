import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_growth/filestorage.dart';

class SliderPromos extends StatelessWidget {
  List<String> imageLinks;

  SliderPromos({Key key, this.imageLinks});

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;

    // TODO: implement build
    return CarouselSlider(
      options: CarouselOptions(height: height/5),
      items: imageLinks.map((e) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () => null,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(e)
                    )
                  ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
