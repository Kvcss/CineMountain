

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';
import 'package:projetointegrado_e/usuario/Home.dart';
class Recibo extends StatefulWidget {
  Filmes getFilme = Filmes();
  Partes getSalaHorario = Partes();
  int valorTotal;

   Recibo(this.getFilme,this.getSalaHorario,this.valorTotal,{Key? key}) : super(key: key);

  @override
  State<Recibo> createState() => _ReciboState();
}

class _ReciboState extends State<Recibo> {
  _adicionarPreVendas()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection("Recibos");
    collection.doc().set(
        {
          'Horario: ': widget.getSalaHorario.Horario,
          'Nome do Filme: ': widget.getFilme.NomeDoFilme,
          'Sala: ': widget.getSalaHorario.Sala,
          'Valor Total: ':widget.valorTotal,

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 900,
          width: 500,
          color: Colors.black,
          child: Column(
            children: [
             const SizedBox(
                height: 70,
              ),
              Container(
                height: 50,
                width: 300,
                color: Colors.black,
                child: const Center(
                  child: Text('Recibos', style: TextStyle(
                    color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold
                  ),),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text('Nome do Filme:', style: TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold
                ),),
              ),
              const SizedBox(
                height: 20,
              ),
               Center(
                child: Text(widget.getFilme.NomeDoFilme.toString(), style: const TextStyle(
                    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold
                ),),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 100,
                width: 300,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                          child: Image.network("https://i.pinimg.com/564x/4a/0f/91/4a0f91691962d4391bccc46e9b4aee06.jpg"),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                           const Center(
                              child: Text("Horario:", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(widget.getSalaHorario.Horario, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 300,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                          child: Image.network("https://cdn-icons-png.flaticon.com/512/686/686648.png",color: Colors.white,),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            const Center(
                              child: Text("Sala: ", style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Center(
                              child: Text(widget.getSalaHorario.Sala, style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
             const SizedBox(
                height: 40,
              ),
              const Center(
                child: Text("Retirar Produtos na Bomboniere do",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              const Center(
                child: Text("cinema (apresentando QR CODE)",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                  child: Image.network("https://s3-alpha-sig.figma.com/img/c327/f2b5/b43ebe481ff7c01a0ecd0d5000268fcc?Expires=1654473600&Signature=LgXny3ZGmmV15fTKZ2j4WCJtFOfPUrfRHSoUgKwAoLngy702eub~fv8JzLZT~SFe23Ki0H56xQR1a47gMd-RiUbOkOsZGgmsQDDQEC3G0itB7V18Ev-l4DJNL~qSsDCnzBjnzyHsjo-eDh7tOFErIooMJBZjsUUeSNZL0~HSnOfVsJ37pavVrf4CW5RMDx1sRBpYPMduJcdklKkIW0MScF3rr5P8P103hodCOsJ5SSLlEv6H~fTviHSPfKGHV--hnW1XAqNCt36rmU4CMdn3ovPj9owVU-dzJqNCJ3Ppv8GrnsuToERcgmYp8c6aKoTOCh~2QNxGrptnV5j4-0Uguw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                child: Container(
                  height: 50,
                  width: 270,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: const Center(
                      child: Text("Voltar para o menu! Obrigado.", style:  TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),)
                  ),
                ),
                onTap: (){
                  _adicionarPreVendas();
                  // String getFilme = widget.getFilme.NomeDoFilme.toString();
                  //   print(widget.list);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home()));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
