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
          CardApp(addres:'https://s3-alpha-sig.figma.com/img/914e/6e3d/5d01c3055ecc7a90e92eaca717886ba3?Expires=1649635200&Signature=hlhJIleb4oKi9MGViQQ911xktrKplYd4IW~RdrGtMAIVg301Tgw9jypsthHz6QMfhxK4hKMKFlt~VcabllkmnSWcwjoXuUbwajC3eQBDIeO4eOM-9HykmP9CXXMClICD8RQEFXnjePUW3nu3HOFmeHESlwsxawnYjMt-BBAmHOiZHwrK9cG92h9JImit8Fzl-s~3M~71r0hv~cSakujWJZNPArYUqFv35vFX8tu2JO3pF3oqVe-T2JWDjQIQk5uI~8ioWv-UYRa0T84ie0cYp5ZgKb72ao~YEL1uACa09D44tw55gZ-NyJYFXg8MInDADHJ7AmQcMVvk8o~jIgqTOw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
        ],
      ),
    );
  }
}
