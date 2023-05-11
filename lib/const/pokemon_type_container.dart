import 'package:flutter/material.dart';
import 'package:responsive_pokemon_app/const/text_style.dart';

Widget typeContainer({String? text, Color? color, double? size}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.30),
      borderRadius: BorderRadius.circular(12),
    ),
    child: normalText(
      text: text,
      color: color,
      size: size,
    ),
  );
}
