import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiHelper{
  CustomTf(double border , String text,IconData iconData,TextEditingController controller,String label){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 15),
      child: TextField(
        controller:  controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
          hintText: text,
          prefixIcon: Icon(iconData),
          label: Text(label)
        ),
      ),
    );
  }

  CustomTf1(String text,TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 15),
      child: TextField(
        controller:  controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text,
        ),
      ),
    );
  }
}