import 'package:flutter/material.dart';

class TextStyles{

static Widget labelLarge(String message, [Color color = Colors.black]){
  return Text(message, style: TextStyle(
              fontSize:25,
              fontWeight:FontWeight.bold,
              color: color
  ));
}


}