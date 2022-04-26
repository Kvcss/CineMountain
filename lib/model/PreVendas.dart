class PreVenda{
  late String _NomeDoFilme;
  late String _DataLancamento;
  late String _Horario;
  late String _Sala;

  PreVenda();


  String get NomeDoFilme => _NomeDoFilme;

  set NomeDoFilme(String value) {
    _NomeDoFilme = value;
  }

  String get DataLancamento => _DataLancamento;

  set DataLancamento (String value) {
    _DataLancamento = value;
  }
  String get Horario => _Horario;

  set Horario (String value) {
    _Horario = value;
  }
  String get Sala => _Sala;

  set Sala (String value) {
    _Sala = value;
  }

}