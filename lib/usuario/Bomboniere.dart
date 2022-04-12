import 'package:flutter/material.dart';


class Bomboniere extends StatefulWidget {
  const Bomboniere({Key? key}) : super(key: key);

  @override
  State<Bomboniere> createState() => _BomboniereState();
}

class _BomboniereState extends State<Bomboniere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Bomboniere', style: TextStyle(color: Colors.white),),
      ),
      ); // Item builder é para apresentar o
    }
  }
