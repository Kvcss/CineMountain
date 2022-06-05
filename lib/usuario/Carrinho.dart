

import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';
import 'package:projetointegrado_e/usuario/Pagamento.dart';
import 'package:projetointegrado_e/usuario/TipoIngresso.dart';

import 'Bomboniere.dart';

class Carrinho extends StatefulWidget {
  List<Filmes> lista;
  int contador;
  Filmes getFilmes = Filmes();
  int valorTotal;
  List<Filmes>listaCompras;
  int valorCompras;
  Partes getSalaHorario = Partes();
   Carrinho(this.lista,this.contador,this.getFilmes,this.valorTotal,this.listaCompras,this.valorCompras,this.getSalaHorario,{Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  List lista= ['ola', 'legal'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Center(
                child: Text("Carrinho",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 29)),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 270,
                width: 500,
                color: Colors.black,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.lista.length,
                  itemBuilder: (context, index){
                    return
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                height: 120,
                                width: 400,
                                color: Colors.black,
                                child: SingleChildScrollView(
                                  // Text("${lista[index]}")
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                        ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 90,
                                            color: Colors.black,
                                            child: Image.network(widget.lista[index].Url),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            children: [
                                              Center(
                                                child: Text(widget.lista[index].Sinopse, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              ),
                                              Center(
                                                child: Text("Filme: "+widget.lista[index].NomeDoFilme, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              ),
                                              Center(
                                                child: RaisedButton(
                                                  child: const Text(
                                                    "Ajustar quantidade",
                                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                                  ),
                                                  color: Colors.pink,
                                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(32)
                                                  ),
                                                  onPressed: (){
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => TipoIngresso(widget.getFilmes,widget.contador,widget.getSalaHorario)));
                                                  },
                                                ),
                                              )
                                            ],

                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      );

                  },
                ),
              ),
             const  SizedBox(height: 20),
              Center(child: const Text('------------Guloseimas------------', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),),
              Container(
                height: 270,
                width: 400,
                color: Colors.black,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.listaCompras.length,
                  itemBuilder: (context, index){
                    return
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                                height: 120,
                                width: 400,
                                color: Colors.black,
                                child: SingleChildScrollView(
                                  // Text("${lista[index]}")
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 90,
                                            color: Colors.black,
                                            child: Image.network(widget.listaCompras[index].Url),
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            children: [
                                              Center(
                                                child: Text(widget.listaCompras[index].Sinopse, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              ),
                                             const Center(
                                                child: Text("Alimento ", style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),),
                                              ),
                                              Center(
                                                child: RaisedButton(
                                                  child: const Text(
                                                    "Ajustar quantidade",
                                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                                  ),
                                                  color: Colors.pink,
                                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(32)
                                                  ),
                                                  onPressed: (){
                                                    setState(() {
                                                      widget.valorTotal = widget.valorTotal - widget.valorCompras;
                                                    });
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) => Bomboniere(widget.lista, widget.contador, widget.getFilmes, widget.valorTotal,widget.getSalaHorario)));
                                                  },
                                                ),
                                              )
                                            ],

                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                            ),

                          ],
                        ),
                      );

                  },
                ),

              ),
              Container(
                height: 75,
                width: 400,
                color: Colors.black,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Total: R\$" +widget.valorTotal.toString()+',00', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
                        const SizedBox(
                          width: 40,
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 150,
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
                            /* setState(() {
                              valorTotal = inteira + meia_entrada + cine_pass;
                            });

                            */
                            print(widget.getSalaHorario.Horario);
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pagamento(widget.valorTotal,widget.getFilmes,widget.getSalaHorario)));

                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


