
import 'package:flutter/material.dart';

import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';

import 'package:projetointegrado_e/usuario/TipoIngresso.dart';

import 'auxiliarLista.dart';


class EscolhaAssentos extends StatefulWidget {
  String lista;
  Filmes getNomeFilme = Filmes();
  var _chairStatus;
  Partes getSalaHorario = Partes();
  EscolhaAssentos(this._chairStatus,this.getNomeFilme,this.lista,this.getSalaHorario,{Key? key}) : super(key: key);

  @override
  State<EscolhaAssentos> createState() => _EscolhaAssentosState();
}

class _EscolhaAssentosState extends State<EscolhaAssentos> {
 /* var _chairStatus = [
    [1,1,1,1,1,1,1],
    [1,1,1,1,3,1,1],
    [1,1,1,1,1,3,3],
    [1,1,1,1,1,3,3],
    [1,1,1,1,1,3,3],
    [1,1,1,1,1,3,3],
  ];

  */
   int index = 0;
  List<Color> myColors = [
    Colors.white,
    Colors.blue,
  ];
  int contador =0;

  Widget _chairList(){
    Color colors = Colors.white;

      Size size = MediaQuery.of(context).size;
      return Container(
        child: Column(
          children: [
            for(int i = 0; i< 6; i++)
              Container(
                margin: EdgeInsets.only(top: i== 3 ? size.height *0.02 : 0),
                child: Row(
                  children: [
                    for(int x = 0; x< 9; x++)
                      Expanded(
                        flex: x == 0 || x == 8 ? 2 : 1,
                        child: x==0 ||
                        x == 8 ||
                            (i == 0 && x == 1) ||
                            (i == 0 && x == 7) ||
                            (x == 4)? Container() :
                          Container(
                          height: size.width/11 - 10,
                          margin: EdgeInsets.all(5.0),
                          child: widget._chairStatus[i][x - 1] == 1 ?
                              // CADEIRAS SELECIONADAS
                            GestureDetector(
                              onTap: //
                              (){
                                  changeColorIndex(i,x-1);
                                  setState(() {
                                    contador = contador +1;
                                    print(contador);
                                  });

                              },
                              child: Container(
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6.0)
                                ),
                              ),

                            )
                          :widget._chairStatus [i][x - 1] == 2
                          ? GestureDetector(
                            onTap: (){
                              changeColorIndexUndo(i,x-1);
                              setState(() {
                                contador = contador -1;
                                print(contador);
                              });
                            },
                            child: Container(
                              height: 10.0,
                              width: 10.0,
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(6.0)
                              ),
                            ),
                          )
                          :Container(
                            height: 10.0,
                            width: 10.0,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(6.0)
                            ),
                          )
                          ,
                        ),

                      )

                  ],
                ),
              )
          ],
        ),
      );
  }
  changeColorIndex(int i, x){
    setState(() {
      widget._chairStatus[i][x]=2;
    });


  }
  changeColorIndexUndo(int i, x){
    setState(() {
      widget._chairStatus[i][x] =1;
    });
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size.width,
            ),
            //Movie white scream
            Positioned(
              top: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.65,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.white,Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 1],
                      )
                    ),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.55,
                    decoration: const BoxDecoration(
                      border : Border(
                        top: BorderSide(
                          width: 6.0,
                          color: Colors.white
                        )
                      )
                    ),
                  )
                ],
              ),
            ),
            //end movie white scream
            Positioned(
              bottom: size.height * 0.3,
              child: Container(
                width: size.width,
                child: _chairList(),
              )
            ),
            Positioned(
              top: 100,
                child: Column(
                  children: [
                    Center(
                      child: Text(widget.getNomeFilme.NomeDoFilme, style: const TextStyle(color: Colors.white,fontSize: 28, fontWeight: FontWeight.bold),),
                    ),
                   const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child:  Text(widget.lista, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                    )
                  ],
                ),
            ),
            Positioned(
              top: 650,
              child: GestureDetector(
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Center(
                      child: Text("Continuar ->", style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                  ),
                ),
                onTap: (){
                  print(widget.getSalaHorario.Horario);
                 // String getFilme = widget.getFilme.NomeDoFilme.toString();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TipoIngresso(widget.getNomeFilme,contador,widget.getSalaHorario)));
                },
              ),
            ),
          ],
        ),
    ),

    );

  }
}
