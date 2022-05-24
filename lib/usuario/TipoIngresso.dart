

import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/usuario/Bomboniere.dart';

import '../model/HelperTipoDeIngresso.dart';

class TipoIngresso extends StatefulWidget {
  Filmes getFilmes = Filmes();
  int contador;

  TipoIngresso(this.getFilmes,this.contador,{Key? key}) : super(key: key);

  @override
  State<TipoIngresso> createState() => _TipoIngressoState();
}

class _TipoIngressoState extends State<TipoIngresso> {
  int inteira = 0;
  int meia_entrada= 0;
  int cine_pass = 0;
  int auxInteira =0;
  int auxMeia=0;
  int auxCine =0;
  int verifica=1;
  List getinfo=[];
  List <Filmes> getMovie=[];
  Filmes obj = Filmes();
  int valorTotal =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('         Tipo de Ingresso', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 200,
              width: 400,
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    height: 170,
                    width: 130,
                    color: Colors.black,
                    child: Image.network(widget.getFilmes.Url),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                        width: 200,
                      ),
                      Center(child: Text(widget.getFilmes.NomeDoFilme,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),
                      Row(
                        children: [
                          Center(
                            child: Text(widget.getFilmes.Genero+'|',style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          Center(
                            child: Text(' '+widget.getFilmes.Duracao,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: 150,
                        color: Colors.black,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Center(child: Text(widget.getFilmes.Sinopse,style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)))
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
              height: 300,
              width: 400,
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 90,
                        width: 400,
                        color: Colors.black,
                        child: Column(
                          children: [
                            Row(
                              children: [
                               const Text('INTEIRA', style: TextStyle(color: Colors.white,fontSize: 19, fontWeight: FontWeight.bold),
                               ),
                               const SizedBox(
                                  width: 210,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.white,
                                    child: Column(
                                     children: const [
                                        Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                     ]
                                    ),
                                  ),
                                  onTap: (){
                                    if(verifica<=widget.contador) {
                                      int i = 1;
                                      setState(() {
                                        Filmes obj1 = Filmes();
                                        auxInteira = auxInteira + 1;
                                        verifica = verifica + 1;
                                        obj1.Url = widget.getFilmes.Url;
                                        obj1.NomeDoFilme = widget.getFilmes.NomeDoFilme;
                                        obj1.Sinopse = (i.toString()+ 'X Ingresso- Inteira');
                                        getMovie.add(obj1);
                                        inteira = inteira + 40;
                                      });

                                    }
                                  },
                                ),
                               const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.white,
                                  child: Center(
                                      child:
                                      Text(auxInteira.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)
                                        ,)
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    color: Colors.white,
                                    child: Column(
                                        children: const [
                                          Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                        ]
                                    ),
                                  ),
                                  onTap: (){
                                    if(auxInteira!=0) {
                                      setState(() {
                                        auxInteira = auxInteira - 1;
                                        verifica = verifica - 1;
                                        getMovie.removeAt(auxInteira);
                                        inteira = inteira - 40;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text('RS 40,00', style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),)
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                 const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: 400,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('MEIA ENTRADA', style: TextStyle(color: Colors.white,fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 140,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: Column(
                                    children: const [
                                      Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                    ]
                                ),
                              ),
                              onTap: (){
                                if(verifica<=widget.contador) {
                                  int i = 1;
                                  setState(() {
                                    Filmes obj2 = Filmes();
                                    auxMeia = auxMeia + 1;
                                    verifica = verifica + 1;
                                    obj2.Url = widget.getFilmes.Url;
                                    obj2.NomeDoFilme = widget.getFilmes.NomeDoFilme;
                                    obj2.Sinopse = (i.toString()+ 'X Ingresso- Meia Entrada');
                                    getMovie.add(obj2);
                                    meia_entrada = meia_entrada + 20;

                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.white,
                              child: Center(child: Text(auxMeia.toString(),style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),))
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: Column(
                                    children: const [
                                      Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                    ]
                                ),
                              ),
                              onTap: (){
                                if(auxMeia!=0) {
                                  setState(() {
                                    auxMeia = auxMeia - 1;
                                    verifica = verifica - 1;
                                    getMovie.removeAt(auxMeia);
                                    meia_entrada = meia_entrada - 20;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('RS 20,00', style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: 400,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text('CINE PASS', style: TextStyle(color: Colors.white,fontSize: 19, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 186,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: Column(
                                    children: const [
                                      Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                    ]
                                ),
                              ),
                              onTap: (){
                                if(verifica<=widget.contador) {
                                  int i =1;
                                  setState(() {
                                    Filmes obj3 = Filmes();
                                    auxCine = auxCine + 1;
                                    verifica = verifica + 1;
                                    obj3.Url = widget.getFilmes.Url;
                                    obj3.NomeDoFilme = widget.getFilmes.NomeDoFilme;
                                    obj3.Sinopse = (i.toString()+ 'X Ingresso- Cine Pass');
                                    getMovie.add(obj3);
                                    cine_pass = cine_pass + 20;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              width: 30,
                              color: Colors.white,
                              child: Center(child: Text(auxCine.toString(),style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 30,
                                width: 30,
                                color: Colors.white,
                                child: Column(
                                    children: const [
                                      Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                    ]
                                ),
                              ),
                              onTap: (){
                                if(auxCine!=0) {
                                  setState(() {
                                    auxCine = auxCine - 1;
                                    verifica = verifica - 1;
                                    getMovie.removeAt(auxCine);
                                    cine_pass = cine_pass - 20;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('RS 20,00', style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.bold),)
                          ],
                        )
                      ],
                    ),
                  ),


                ],
              ),
            ),
            GestureDetector(
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
                // String getFilme = widget.getFilme.NomeDoFilme.toString();
                setState(() {
                  valorTotal = inteira + meia_entrada + cine_pass;
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Bomboniere(getMovie,widget.contador,widget.getFilmes,valorTotal)));
              },
            ),
          ],
        ),
      ),

    );
  }
}
