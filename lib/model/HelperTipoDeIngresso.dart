class   HelperTipo{
  late String _urlfilme;
  late String _nomefilme;
  late String _tipoingresso;

  HelperTipo();

  String get urlfilme => _urlfilme;

  set urlfilme(String value) {
    _urlfilme = value;
  }

  String get nomefilme => _nomefilme;

  set nomefilme(String value) {
    _nomefilme = value;
  }

  String get tipoingresso => _tipoingresso;

  set tipoingresso(String value) {
    _tipoingresso = value;
  }
}
