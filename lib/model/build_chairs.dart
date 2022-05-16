import 'package:flutter/material.dart';

class BuildChairs{
  static Widget selectedChair(){
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(6.0)
      ),
    );
  }
  static Widget avaliableChair(){
    return GestureDetector(
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0)
        ),
      ),
    );
  }
  static Widget reservedChair(){
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(6.0)
      ),
    );
  }
}