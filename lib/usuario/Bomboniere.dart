import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';


import 'Carrinho.dart';


class Bomboniere extends StatefulWidget {
  List <Filmes> lista;
  int contador;
  Filmes getFilmes = Filmes();
  int valorTotal;
  Bomboniere(this.lista,this.contador,this.getFilmes,this.valorTotal,{Key? key}) : super(key: key);

  @override
  State<Bomboniere> createState() => _BomboniereState();
}

class _BomboniereState extends State<Bomboniere> {
  String UrlBebidas="";
  String UrlDoces="";
  String UrlPipocas = "";
  String UrlCombo = "";
  String mensagem = "";
  String NomeBebida = "";
  String NomeDoce = "";
  String NomePipoca = "";
  String NomeCombo = "";
  int contCombo =0;
  int contPipocas =0;
  int contBebidas =0;
  int contDoce =0;
  int valorCombo =0;
  int valorPipocas =0;
  int valorBebidas =0;
  int valorDoces =0;
  int valorCompras=0;
  int valorTotalTudo =0;
  List<Filmes> listaProdutos=[];

  Future lerDados()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('produtos');
    var result = await collection.get();

    for(var doc in result.docs){
      if(doc['nome'] == 'Bebidas'){
        UrlBebidas = doc['imagem'];
        NomeBebida = doc['nome'];
      }
      if(doc['nome'] == 'Doces'){
        UrlDoces = doc['imagem'];
        NomeDoce = doc['nome'];

      }
      if(doc['nome'] == 'Pipocas'){
        UrlPipocas = doc['imagem'];
        NomePipoca = doc['nome'];

      }
      if(doc['nome'] == 'Combo'){
        UrlCombo = doc['imagem'];
        NomeCombo = doc['nome'];

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: lerDados(),
            initialData: "Aguardando os dados...",
            builder: (context, snapshot) {
              return Container(
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: _screenHeight * .1, //strech
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight * .10,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 0),
                                      child: Text(
                                        "Bomboniere",
                                        style: TextStyle(
                                            fontSize: 38,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _screenHeight * .018,
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              color: Colors.black,
                              height: _screenHeight * .15,
                              child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: _screenHeight*.10,
                                        width: _screenHeight*.15,
                                        color: Colors.black,
                                        child: Image.network(
                                            "https://s3-alpha-sig.figma.com/img/1c97/54b5/48a0238d86e28b37fca2641772730fee?Expires=1654473600&Signature=CA5B3606edvbAaxmBLh3NfbtSr-USSDfOR1GmaJS0jGm783yLXyn~3YRQdBP7UWkQpERt8CVim2MUdQiIL092auAXIOZ-hvbhTUFBV4k~M3NfQcMre-gWnD1Qrl3Oye7h~8rYAGYKqb3PsSjSEfMgtV4cHtwCYvPb4RvSw15lf1ux3uEYr-ZaRdFrRg0MtT-WXjMnCnrRUj5ujdFANprkl0gqoFTV4dnxl6-C8GCgGBbIPqqWy-irzOmeGJwNAqqLxn2vKpKj~zW5rfCDlDqKXSRYRJ~y59ezsxOAVUi1oLXx2hnnyLxkR6Hc0K1wPvE8e8~URn-XTtGurNIYHyPIA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                                      ),
                                      const  SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(NomeCombo,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                            ],

                                          ),
                                          Row(
                                            children:const <Widget>[
                                              Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                            ],
                                          ),
                                          Row(
                                            children:const <Widget>[
                                              Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5, bottom: 0),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        color: Colors.white,
                                                        child: Column(
                                                          children: const [
                                                            Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: (){
                                                        setState(() {
                                                          int i=1;
                                                          Filmes obj = Filmes();
                                                          obj.Url =
                                                              "https://s3-alpha-sig.figma.com/img/1c97/54b5/48a0238d86e28b37fca2641772730fee?Expires=1654473600&Signature=CA5B3606edvbAaxmBLh3NfbtSr-USSDfOR1GmaJS0jGm783yLXyn~3YRQdBP7UWkQpERt8CVim2MUdQiIL092auAXIOZ-hvbhTUFBV4k~M3NfQcMre-gWnD1Qrl3Oye7h~8rYAGYKqb3PsSjSEfMgtV4cHtwCYvPb4RvSw15lf1ux3uEYr-ZaRdFrRg0MtT-WXjMnCnrRUj5ujdFANprkl0gqoFTV4dnxl6-C8GCgGBbIPqqWy-irzOmeGJwNAqqLxn2vKpKj~zW5rfCDlDqKXSRYRJ~y59ezsxOAVUi1oLXx2hnnyLxkR6Hc0K1wPvE8e8~URn-XTtGurNIYHyPIA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                         obj.Sinopse = i.toString() + 'Combo';
                                                          contCombo = contCombo +1;
                                                          listaProdutos.add(obj);
                                                          valorCombo = valorCombo +15;

                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(
                                                      width:10 ,
                                                    ),
                                                    Container(
                                                      height: 30,
                                                      width: 30,
                                                      color: Colors.white,
                                                      child: Center(
                                                        child:
                                                        Text(contCombo.toString(),style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width:10 ,
                                                    ),
                                                    GestureDetector(
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        color: Colors.white,
                                                        child: Column(
                                                          children: const [
                                                            Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                          ],
                                                        ),
                                                      ),
                                                      onTap: (){
                                                        if(contCombo!=0) {
                                                          setState(() {
                                                            contCombo =
                                                                contCombo - 1;
                                                                listaProdutos.removeAt(contCombo);
                                                                valorCombo = valorCombo - 15;
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(
                                      "https://s3-alpha-sig.figma.com/img/e075/c0d6/f95e2160a8c09187c57e93d97175cff9?Expires=1654473600&Signature=T1vDg7x0Pvl9RkB9Ve3oZON1XflXn6j0ZEvwNHwTNc0t9i-W7yu7AoIX7E0ZPirAROnACoWFzPnYH6d1CEj-YOM7L3i0-N3zHqPuls69-5YWaLGPs6sJ5UMVe8psRJRQxpu1xLw5PYjxsPIJfBiFkrnrNdJcOuitoKiKTN3pZIzNbD6c3oRens3~8eGlfezgp-iFTXfBv8rI~n-jeh7Bjzco4ut9QTWlAb3uOCMjE39YoQcMc1mS2~IjUs06lX3lwTBiRhyIOXIHwK7xJaNHz5Og0bzHPxtxY~iVGm~~Oz2icHqNdxdzfWZqvMY6dFnbQGDfOP-BGa5SSYMw5YCicw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomePipoca,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                      Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                    setState(() {
                                                      Filmes obj2 = Filmes();
                                                      int i =1;
                                                      contPipocas = contPipocas +1;
                                                      obj2.Url =
                                                          "https://s3-alpha-sig.figma.com/img/e075/c0d6/f95e2160a8c09187c57e93d97175cff9?Expires=1654473600&Signature=T1vDg7x0Pvl9RkB9Ve3oZON1XflXn6j0ZEvwNHwTNc0t9i-W7yu7AoIX7E0ZPirAROnACoWFzPnYH6d1CEj-YOM7L3i0-N3zHqPuls69-5YWaLGPs6sJ5UMVe8psRJRQxpu1xLw5PYjxsPIJfBiFkrnrNdJcOuitoKiKTN3pZIzNbD6c3oRens3~8eGlfezgp-iFTXfBv8rI~n-jeh7Bjzco4ut9QTWlAb3uOCMjE39YoQcMc1mS2~IjUs06lX3lwTBiRhyIOXIHwK7xJaNHz5Og0bzHPxtxY~iVGm~~Oz2icHqNdxdzfWZqvMY6dFnbQGDfOP-BGa5SSYMw5YCicw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                      obj2.Sinopse = i.toString() + 'Pipocas';
                                                      listaProdutos.add(obj2);
                                                      valorPipocas = valorPipocas +10;


                                                    });
                                                },
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.white,
                                                child: Center(
                                                    child:
                                                    Text(contPipocas.toString(),style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
                                                ),
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                      Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                  if(contPipocas != 0) {
                                                    setState(() {
                                                      contPipocas =
                                                          contPipocas - 1;
                                                      listaProdutos.removeAt(contPipocas);
                                                      valorPipocas = valorPipocas - 10;
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(
                                      "https://s3-alpha-sig.figma.com/img/c1c9/6b5c/7069e046c99e72e17349b6e9667233ec?Expires=1654473600&Signature=RDsVJH53NTpjFXTFcVfyCPCHQTa3lfNltPccwdwDWiwC4Mk64ypy8AfdZugYkVUu0kZgoSreIDR-rutklmDYXSdzehm43fPUYuUdUsWPSxVypzVt8zRTmMFzZpKvZx98m5BjJpYUpwyKDF5bse7gg7Op4Wpn17H9aPIu6Yg9icPOB4mTRIfAfVvzNVD5hl~8Mj5g9Lx9p2Dw6njNCNDbEQtOtu~9pNhrKCZyi5kMOLwVKWyQafd74Dvgjn6c4gxG32NuOx28YjLF~Fh9SFmJz~4X0W2V9BJErOx4gaYvgQRxmW4fllDEUaRIIsYNlQ0nKcrrdTE1z0fKOfh5K9bzpw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                                ),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomeBebida,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                      Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                  setState(() {
                                                    int i=1;
                                                    Filmes obj3 = Filmes();
                                                    obj3.Url =
                                                        "https://s3-alpha-sig.figma.com/img/c1c9/6b5c/7069e046c99e72e17349b6e9667233ec?Expires=1654473600&Signature=RDsVJH53NTpjFXTFcVfyCPCHQTa3lfNltPccwdwDWiwC4Mk64ypy8AfdZugYkVUu0kZgoSreIDR-rutklmDYXSdzehm43fPUYuUdUsWPSxVypzVt8zRTmMFzZpKvZx98m5BjJpYUpwyKDF5bse7gg7Op4Wpn17H9aPIu6Yg9icPOB4mTRIfAfVvzNVD5hl~8Mj5g9Lx9p2Dw6njNCNDbEQtOtu~9pNhrKCZyi5kMOLwVKWyQafd74Dvgjn6c4gxG32NuOx28YjLF~Fh9SFmJz~4X0W2V9BJErOx4gaYvgQRxmW4fllDEUaRIIsYNlQ0nKcrrdTE1z0fKOfh5K9bzpw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                   obj3.Sinopse  = i.toString() + 'Bebidas';
                                                   listaProdutos.add(obj3);
                                                    contBebidas = contBebidas +1;
                                                    valorBebidas = valorBebidas +6;
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.white,
                                                child: Center(
                                                    child:
                                                    Text(contBebidas.toString(),style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
                                                ),
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                      Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                  if(contBebidas!=0) {
                                                    setState(() {
                                                      contBebidas =
                                                          contBebidas - 1;
                                                      listaProdutos.removeAt(contBebidas);
                                                      valorBebidas = valorBebidas - 6;
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(
                                      "https://s3-alpha-sig.figma.com/img/27e2/fd15/cb2397fe78cfe7c89a0124bd5bdcb5b0?Expires=1654473600&Signature=QS0tulWFKQn6NNQa9O8wb6YEor8hzKPhXrX2CGMFoOFgthZ8JCePm7y5~GpC7tatPRILuCO2m-D97S18bWwthQhggjTVfTP8pOAg1HkH5tj9VDq0uZsBx24SeGADwVTqSX3tC6PEzu2JgaEBm1OM0XJZMsAz0KR5eL6e18GNnWisQXWZDz2sBzKEiEdbxeKQv-3-VttMji5gpha9680CfhzJ8NPr0diuVre16XIyqyN3~sC6u1HrQlBQ4Q9GHYDRLJwnzfGJgzrWzT6Cgl75lYbMx2fAKJU9F4M6D0jyN0UPfptYp76a87BjhOx9vaWWmgELq7OW4HvCiDpTqQuhsg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                                ),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomeDoce,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                       Text('+', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                  setState(() {
                                                    int i = 1;
                                                    Filmes obj4 = Filmes();
                                                    contDoce = contDoce +1;

                                                    obj4.Url = "https://s3-alpha-sig.figma.com/img/27e2/fd15/cb2397fe78cfe7c89a0124bd5bdcb5b0?Expires=1654473600&Signature=QS0tulWFKQn6NNQa9O8wb6YEor8hzKPhXrX2CGMFoOFgthZ8JCePm7y5~GpC7tatPRILuCO2m-D97S18bWwthQhggjTVfTP8pOAg1HkH5tj9VDq0uZsBx24SeGADwVTqSX3tC6PEzu2JgaEBm1OM0XJZMsAz0KR5eL6e18GNnWisQXWZDz2sBzKEiEdbxeKQv-3-VttMji5gpha9680CfhzJ8NPr0diuVre16XIyqyN3~sC6u1HrQlBQ4Q9GHYDRLJwnzfGJgzrWzT6Cgl75lYbMx2fAKJU9F4M6D0jyN0UPfptYp76a87BjhOx9vaWWmgELq7OW4HvCiDpTqQuhsg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                    obj4.Sinopse = i.toString() + 'Doces';
                                                    listaProdutos.add(obj4);
                                                    valorDoces = valorDoces +3;
                                                  });

                                                },
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                color: Colors.white,
                                                child: Center(
                                                    child:
                                                    Text(contDoce.toString(),style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),)
                                                ),
                                              ),
                                              const SizedBox(
                                                width:10 ,
                                              ),
                                              GestureDetector(
                                                child: Container(
                                                  height: 30,
                                                  width: 30,
                                                  color: Colors.white,
                                                  child: Column(
                                                    children: const [
                                                      Text('-', style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold))
                                                    ],
                                                  ),
                                                ),
                                                onTap: (){
                                                  if(contDoce!=0) {
                                                    setState(() {
                                                      contDoce =
                                                          contDoce - 1;
                                                          listaProdutos.removeAt(contDoce);
                                                          valorDoces = valorDoces -3;
                                                    });
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                  const SizedBox(height: 30,),

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
                   //   print(widget.list);
                      setState(() {
                        valorCompras = valorCombo + valorPipocas + valorBebidas + valorDoces;
                        valorTotalTudo = widget.valorTotal + valorCompras;

                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Carrinho(widget.lista,widget.contador,widget.getFilmes,valorTotalTudo,listaProdutos)));
                    },
                  ),

                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );
  }
}