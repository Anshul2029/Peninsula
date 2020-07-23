import 'package:flutter/material.dart';
import 'package:Peninsula/constants.dart';

SizedBox box(String text){
  return SizedBox(width: double.infinity,
    height: 47,
    child: Center(
      child: Text(text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      ),
    ),
  );
}

RawMaterialButton button(String text){
  return RawMaterialButton(
    fillColor: Colors.blue,
    elevation: 2,
    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5),),
    child: box(text),
  );
}

InputDecoration iconfield(IconData icon, String field){
  return InputDecoration(
    border: InputBorder.none,
    icon: Padding(
      padding: const EdgeInsets.fromLTRB(10,0,0,0),
      child: Icon(icon, color: Colors.white,),
    ),
    hintText: field,
    hintStyle: TextStyle(
      color: Colors.white60,
      fontSize: 16,
    ),
  );
}