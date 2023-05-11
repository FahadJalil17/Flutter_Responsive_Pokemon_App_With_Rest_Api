import 'package:flutter/material.dart';
import 'package:responsive_pokemon_app/const/text_style.dart';

import 'colors.dart';

Widget RowStyling({String? text, String? value}){
  return Row(
    children: [
      SizedBox(width: 100, child: headingText(text: text, size: 16, color: grey)),
      headingText(text: value, size: 16, color: grey)
    ],
  );
}