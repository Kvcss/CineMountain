

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/dataSelector.dart';
class EscolhaSessao extends StatefulWidget {
  Filmes getFilme = Filmes();


  EscolhaSessao(this.getFilme,{Key? key}) : super(key: key);
  @override
  State<EscolhaSessao> createState() => _EscolhaSessaoState();
}

class _EscolhaSessaoState extends State<EscolhaSessao> {
  String teste1= "SEG.";
  int dateIndexSelected = 1;
  DateTime currentDate = DateTime.now();

  String ? _dayFormat(int dayWeek){
    switch (dayWeek){
      case 1:
        return "SEG";
        break;
      case 2:
        return "TER";
        break;
      case 3:
        return "QUA";
        break;
      case 4:
        return "QUI";
        break;
      case 5:
        return "SEX";
        break;
      case 6:
        return "SAB";
        break;
      case 7:
        return "DOM";
        break;
      default:
        return "SEG";
        break;

    }
  }

  get color => null;
  @override
  Widget build(BuildContext context) {
   // Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("           " + widget.getFilme.NomeDoFilme.toString(), style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                color: Colors.black,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 170,
                      width: 130,
                      color: Colors.black,
                      child: Image.network(widget.getFilme.Url.toString()),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(widget.getFilme.NomeDoFilme.toString(), style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17,
                          )) ,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Row(
                            children: [
                              Text("Gênero: "+widget.getFilme.Genero.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              )),
                             const SizedBox(
                                width: 10,
                              ),
                              Text("Duração: "+widget.getFilme.Duracao.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              )),
                            ],
                          ) ,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.black,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Sinopse: "+widget.getFilme.Sinopse.toString(), style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            )),
                          ),

                        ),
                      ],

                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
               height: 110,
                width: 340,
                decoration: const BoxDecoration(
                  color: (Colors.white10),
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                )
              ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 14,
                    ),
                    Container(
                      width: 320,
                      child: ListView.builder(
                        itemCount: 7,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          var data = currentDate.add(Duration(days: index));
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                dateIndexSelected = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(13),
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10
                              ),
                              width: 80,
                              decoration: BoxDecoration(
                                color: dateIndexSelected == index ? color: Colors.pink,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    data.day.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      height: 1.0,
                                      color: index == dateIndexSelected ?(Colors.white):(Colors.black)
                                    ),
                                  ),
                                  Text(
                                    _dayFormat(data.weekday)!, style: TextStyle(color: index == dateIndexSelected ?(Colors.white):(Colors.black), fontWeight: FontWeight.bold,fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          );
                        },

                      ),
                    )
                  ],
                ),
              ),
             const SizedBox(
                height: 60,
              ),
              Container(
                height: 200,
                width: 370,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: StreamBuilder(
                    stream:
                  ),
                ),
              )
            ],
          ),
        )

    ),
    );
}
}