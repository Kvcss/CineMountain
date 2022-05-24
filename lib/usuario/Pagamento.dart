
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';
import 'package:projetointegrado_e/usuario/Recibo.dart';

class Pagamento extends StatefulWidget {
  int valor;
  Filmes getFilmes = Filmes();
  Partes getSalaHorario = Partes();
   Pagamento(this.valor,this.getFilmes,this.getSalaHorario,{Key? key}) : super(key: key);

  @override
  State<Pagamento> createState() => _PagamentoState();
}

class _PagamentoState extends State<Pagamento> {
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 800,
                        width: 500,
                        color: Colors.black,
                        child: Column(
                          children:  [
                           const Center(
                              child: Text(
                                'Pagamento', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                           const SizedBox(
                             height: 40,
                            ),
                            Center(
                              child: Text(
                                'Valor R\$:'+widget.valor.toString()+',00',  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Container(
                                height: 88,
                                width: 135,
                                color: Colors.black,
                                child: Image.network("https://s3-alpha-sig.figma.com/img/b176/da0f/946d36b515099616104671625d8e38d8?Expires=1654473600&Signature=Ag8ymB80YZJcGZSMJ62iWpRqz6yFc7OSw-NB3hb8h7rHy2HK0glKWDCP3rHuDGrojQ01BK7nGTgMesgztn47aO5NeqlCGiprM3SsimKSUj5q~3A8InKueOCqD95vZ4tpnTkOIn9WFN90F8w9CYItJcIw5DTTCvhTUAgIqRHLQUQeP17lTXi7720mWVOP0Td3NSy7OA1gABlJX1hEcMCabFgPpDs6cp~8Rt8DAqoBnlh0YdE6~X7xRtqDm8UGjPqACZTL7KsZ7i0MCGz5ZIe6fApy~aiOf3Jip7zY5Be6iNyc-OMJIgfcKyed9HBu63s6XA-H9YnxcN0MPsk6DLU4UQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 170,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: const Center(
                                    child: Text("PIX!", style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                                ),
                              ),
                              onTap: (){
                                // String getFilme = widget.getFilme.NomeDoFilme.toString();
                                //   print(widget.list);
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: 250,
                              color: Colors.black,
                              child: TextField(
                                //controller: _controllerDataLancamento,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                    hintText: "Numero do Cartão:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 50,
                              width: 250,
                              color: Colors.black,
                              child: TextField(
                                //controller: _controllerDataLancamento,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                    hintText: "Nome do Cartão:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                ),
                                Container(
                                  height: 50,
                                  width: 80,
                                  color: Colors.black,
                                  child: TextField(
                                    //controller: _controllerDataLancamento,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(fontSize: 15),
                                    decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                        hintText: "CV:",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                Container(
                                  height: 50,
                                  width: 120,
                                  color: Colors.black,
                                  child: TextField(
                                    //controller: _controllerDataLancamento,
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(fontSize: 15),
                                    decoration: InputDecoration(
                                        contentPadding:
                                        const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                        hintText: "Validade:",
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10))),
                                  ),
                                )
                              ],
                            ),
                           const SizedBox(
                              height: 50,
                            ),
                            GestureDetector(
                              child: Container(
                                height: 50,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: const Center(
                                    child: Text("Finalizar", style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)
                                ),
                              ),
                              onTap: (){
                                print(widget.getSalaHorario.Horario);
                                // String getFilme = widget.getFilme.NomeDoFilme.toString();
                                //   print(widget.list);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Recibo(widget.getFilmes,widget.getSalaHorario,widget.valor)));
                              },
                            ),

                          ],
                        ),
                      ),

              ],
            ),
          ),
        ),
      );
  }
}

