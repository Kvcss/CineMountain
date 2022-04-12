import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/card_app.dart';
class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  const PageViewApp({Key? key, required this.top, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      left: 0,
      right:0,
      child: PageView(
        onPageChanged: onChanged,
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          CardApp(addres:'https://blogger.googleusercontent.com/img/a/AVvXsEjM8QEiKT_zUqKKI0HaAj9iOoR4Moc_hXuHo-yzzpJhEs-2VBT8D0YO2lv6EfxblyfhLXs9UEWCWbDdzzWEku8dIY106E25HclcR-81VHH9o3DX23Lwfzw5qTmfTyrlldLOfC0z5ygUW4JZl6tOb9UB1Ed_FCsEnDJQIJ_RsoyqDRbgd21fQJv0FASA=s16000' ),
          CardApp(addres:'https://br.web.img3.acsta.net/pictures/22/02/14/18/29/1382589.png'),
          CardApp(addres:'https://ingresso-a.akamaihd.net/prd/img/movie/sonic-2/fde04f56-1afb-4c71-9ff2-97dac723f8d8.jpg')
        ],
      ),
    );
  }
}
