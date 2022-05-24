import 'package:flutter/material.dart';

class BuildChairs{
    selectedChair(){
    var color = Colors.blue;
    return GestureDetector(
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6.0)
        ),
      ),
    );
  }
    avaliableChair(){
    var color = Colors.white;
    return GestureDetector(
      child: Container(
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6.0)
        ),
      ),
      onTap: (){
        color = Colors.pink;
      },
    );
  }
    reservedChair(){
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