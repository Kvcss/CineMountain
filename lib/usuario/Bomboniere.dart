
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
      body: Image.network('https://media.discordapp.net/attachments/933404614391390310/959055061407891456/Screenshot_20220330-205326_Gallery.jpg?width=224&height=473'

      )
    );
  }
}
