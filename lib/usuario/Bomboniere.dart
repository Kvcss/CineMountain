import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';


import 'Carrinho.dart';


class Bomboniere extends StatefulWidget {
  List <Filmes> lista;
  int contador;
  Filmes getFilmes = Filmes();
  int valorTotal;
  Partes getSalaHorario = Partes();
  List <int> lugares = [];
  Bomboniere(this.lista,this.contador,this.getFilmes,this.valorTotal,this.getSalaHorario,this.lugares,{Key? key}) : super(key: key);

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
                                            "https://s3-alpha-sig.figma.com/img/1c97/54b5/48a0238d86e28b37fca2641772730fee?Expires=1655683200&Signature=Hauu41bWB98WZfV6GndtVyEp9rE2O9MBkxkqHqFlOgymzdtI0EKYVaocTdtdafbTQmow7XujcGclss3TNGbK9VP~oitTPkllL5jn-yN0e8lfbb-rUMWxvbfSspN0Md5~6JU0NWKVYnB0N~S7Y-bjBJjeJK8zb1dSkviYLuGxFVBTuB2uVPVJ8ttPcMCjWNA-LpwWELCakaLIChXI1d~b2cS-ZiYQRcsMaiTmKq60HFpq5MA6O0xB~wVvKIb6rThAadkSZwFa~O1N9-EKrdJh~ueGruh2yqwxSDNXG1dvIyUTA8JqUqdc-s~eazA7koNldUJE1MmRrMH-cl4zM54~kA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                                              "https://s3-alpha-sig.figma.com/img/1c97/54b5/48a0238d86e28b37fca2641772730fee?Expires=1655683200&Signature=Hauu41bWB98WZfV6GndtVyEp9rE2O9MBkxkqHqFlOgymzdtI0EKYVaocTdtdafbTQmow7XujcGclss3TNGbK9VP~oitTPkllL5jn-yN0e8lfbb-rUMWxvbfSspN0Md5~6JU0NWKVYnB0N~S7Y-bjBJjeJK8zb1dSkviYLuGxFVBTuB2uVPVJ8ttPcMCjWNA-LpwWELCakaLIChXI1d~b2cS-ZiYQRcsMaiTmKq60HFpq5MA6O0xB~wVvKIb6rThAadkSZwFa~O1N9-EKrdJh~ueGruh2yqwxSDNXG1dvIyUTA8JqUqdc-s~eazA7koNldUJE1MmRrMH-cl4zM54~kA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                         obj.Sinopse = i.toString() + 'X Combo';
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
                                      "https://s3-alpha-sig.figma.com/img/e075/c0d6/f95e2160a8c09187c57e93d97175cff9?Expires=1655683200&Signature=Une9JgZByBFFWgZqO7Ou-wUf4ReS5seIOtDD6goCdd~gevmVy7vYJWGuQYJmXIROXxwLf0gbAjVVHiacS3w6EG3hwi6GYnLHuycR6-BW-zRC3iIoNvOxpxlUKrzKz1y~l4fv-ASjd0Azo7Mjvg9SH6fLtVom3KBq3fh1D-lRRooHTGm1kW4GjHsOEF3pypx18tziTUAURql4QSkJ04hWqbEDHjbAtESkOR1vU1sdauNV1vmwpWm7ZjNvvfV0p9sB8MP5iiGdf1PxDYz1qkcYEiY8Gb82T0cC-gzQ1OUROrLch4J0avqeAKygE09g~39UgkwdEYlz3xSWnivpTYkOrg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA")),
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
                                                          "https://s3-alpha-sig.figma.com/img/e075/c0d6/f95e2160a8c09187c57e93d97175cff9?Expires=1655683200&Signature=Une9JgZByBFFWgZqO7Ou-wUf4ReS5seIOtDD6goCdd~gevmVy7vYJWGuQYJmXIROXxwLf0gbAjVVHiacS3w6EG3hwi6GYnLHuycR6-BW-zRC3iIoNvOxpxlUKrzKz1y~l4fv-ASjd0Azo7Mjvg9SH6fLtVom3KBq3fh1D-lRRooHTGm1kW4GjHsOEF3pypx18tziTUAURql4QSkJ04hWqbEDHjbAtESkOR1vU1sdauNV1vmwpWm7ZjNvvfV0p9sB8MP5iiGdf1PxDYz1qkcYEiY8Gb82T0cC-gzQ1OUROrLch4J0avqeAKygE09g~39UgkwdEYlz3xSWnivpTYkOrg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                      obj2.Sinopse = i.toString() + 'X Pipocas';
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
                                      "https://s3-alpha-sig.figma.com/img/c1c9/6b5c/7069e046c99e72e17349b6e9667233ec?Expires=1655683200&Signature=S9q-zyjiqhrXr36eD5R2PO-hRQJSHvoIR68HVElS0Rl2jybupuGfX7e52OkR8T5JS1poj56MHw3AKx3~r3guYNxrrPcCF2OxdNd26Ekzi9IobeyzBBSTDFUswcSEKCxPwmmaFerafp2ul3s3a1Qx5JiXR4mNixRRvZ-T7~NILgdHkZ4RE5HpIlBKgM7qEX7sFWEI7Y~1OU6d2VvCAI3eWrSogPuQUugff1cgT0xfaMW35grCBuBBg2FyqrtViULBlQyUht4Ys0Cfe~0biRbwF3n-3mvgUKfZpbvlDHQGVp2gMfcLrq1nk-XaemcqdWMGDJEx52khoeYVawS6Ea5Ilw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                                        "https://s3-alpha-sig.figma.com/img/c1c9/6b5c/7069e046c99e72e17349b6e9667233ec?Expires=1655683200&Signature=S9q-zyjiqhrXr36eD5R2PO-hRQJSHvoIR68HVElS0Rl2jybupuGfX7e52OkR8T5JS1poj56MHw3AKx3~r3guYNxrrPcCF2OxdNd26Ekzi9IobeyzBBSTDFUswcSEKCxPwmmaFerafp2ul3s3a1Qx5JiXR4mNixRRvZ-T7~NILgdHkZ4RE5HpIlBKgM7qEX7sFWEI7Y~1OU6d2VvCAI3eWrSogPuQUugff1cgT0xfaMW35grCBuBBg2FyqrtViULBlQyUht4Ys0Cfe~0biRbwF3n-3mvgUKfZpbvlDHQGVp2gMfcLrq1nk-XaemcqdWMGDJEx52khoeYVawS6Ea5Ilw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                   obj3.Sinopse  = i.toString() + 'X Bebidas';
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
                                      "https://s3-alpha-sig.figma.com/img/27e2/fd15/cb2397fe78cfe7c89a0124bd5bdcb5b0?Expires=1655683200&Signature=gi2RI7Zwuv5N2Zx0E9iDtdWtCBZN9V7XPWoWpQApf~z7OG4Yx2eJiBS~fBEdBavEE4XT9433OM9K9PkRcraRS2~33OOsxaby0ABSfO2tHV65JAzPOY7mtN~L7RGQqeiRPGx333ZWpvVtE5-A2iVw0CUazazXP1LmzNHhVoj1hRM4xs9zrkWY4QVwvws9L0FsRg9p4SRZualb6xI2dcQSNH1qWc6FxTOY~Ky-uJIciK7lQLgTLxG3oMSoe~mYRMpHm0YupWaO~lof52J-fOLecph1oNven5GudlU2IvsNrpCFbE9h8o1O-6seDT-u~wUv67keyp5uvUqeYqj9s4Q2tQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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

                                                    obj4.Url = "https://s3-alpha-sig.figma.com/img/27e2/fd15/cb2397fe78cfe7c89a0124bd5bdcb5b0?Expires=1655683200&Signature=gi2RI7Zwuv5N2Zx0E9iDtdWtCBZN9V7XPWoWpQApf~z7OG4Yx2eJiBS~fBEdBavEE4XT9433OM9K9PkRcraRS2~33OOsxaby0ABSfO2tHV65JAzPOY7mtN~L7RGQqeiRPGx333ZWpvVtE5-A2iVw0CUazazXP1LmzNHhVoj1hRM4xs9zrkWY4QVwvws9L0FsRg9p4SRZualb6xI2dcQSNH1qWc6FxTOY~Ky-uJIciK7lQLgTLxG3oMSoe~mYRMpHm0YupWaO~lof52J-fOLecph1oNven5GudlU2IvsNrpCFbE9h8o1O-6seDT-u~wUv67keyp5uvUqeYqj9s4Q2tQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA";
                                                    obj4.Sinopse = i.toString() + 'X Doces';
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
                      print(widget.getSalaHorario.Horario);
                      // String getFilme = widget.getFilme.NomeDoFilme.toString();
                   //   print(widget.list);
                      setState(() {
                        valorCompras = valorCombo + valorPipocas + valorBebidas + valorDoces;
                        valorTotalTudo = widget.valorTotal + valorCompras;

                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Carrinho(widget.lista,widget.contador,widget.getFilmes,valorTotalTudo,listaProdutos,valorCompras,widget.getSalaHorario,widget.lugares)));
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