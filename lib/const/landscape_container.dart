import 'package:flutter/material.dart';
import 'package:responsive_pokemon_app/const/pokemon_type_container.dart';
import 'package:responsive_pokemon_app/const/text_style.dart';

Widget landscapeContainer(data){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headingText(text: data["name"], color: Colors.white, size: 36),
          Row(
            children: [
              typeContainer(text: "Grass", color: Colors.white, size: 16),
              SizedBox(width: 6,),
              typeContainer(text: "Poison", color: Colors.white, size: 16),
            ],
          ),

          SizedBox(height: 50,),

        ],
      ),
      Expanded(
        child: Align(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.bottomCenter, // for showing upper image on bottom of pokeball image
            children: [
              Image.asset('assets/pokeball.jpg', width: 200, color: Colors.white.withOpacity(0.5),),
              Image.network(data["imageurl"], width: 180)
            ],
          ),
        ),
      )
    ],
  );
}
