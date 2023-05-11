import 'package:flutter/material.dart';
import 'package:responsive_pokemon_app/const/text_style.dart';

import 'colors.dart';

Widget statRow({String? text, int? value}){
  var rowWidth = double.parse(value.toString());
  return Row(
    children: [
      SizedBox(
          width: 100,
          child: headingText(text: text, color: grey, size: 16)),
      SizedBox(
          width: 100,
          child: headingText(text: value.toString(), color: black, size: 16)),
      Container(
        height: 3,
        width: rowWidth,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12)
        ),
      )
    ],
  );
}
