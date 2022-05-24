class AuxliarTeste{
  late String _url;
  late String _nomeFilme;
  late String _tipo;

  AuxliarTeste();

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get nomeFilme => _nomeFilme;

  set nomeFilme(String value) {
    _nomeFilme = value;
  }

  String get tipo => _tipo;

  set tipo(String value) {
    _tipo = value;
  }
}