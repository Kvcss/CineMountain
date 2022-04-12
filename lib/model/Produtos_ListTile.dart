import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Produto.dart';

class ProdutoListTile extends StatelessWidget {

  ProdutosListTile(this.produto);
  final Produto produdo;


  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4)
      ),
      // Especificar altura do card
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8), // Elementos se afastarem da borda do container
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,// Quadrado
              child: Image.network(produdo.imagem.first)
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    produto.nome,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Colors.white
                    )
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
