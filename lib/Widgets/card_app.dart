import 'package:flutter/material.dart';
class CardApp extends StatelessWidget {
  final String addres;

  const CardApp({Key? key, required this.addres}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,

            borderRadius: BorderRadius.circular(10)
        ),
        child: Image.network(addres,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
