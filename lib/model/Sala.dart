class Salas{
  late String _NumeroSala;
  late String _TipoSala;
  late String _NumeroLinhas;
  late String _NumeroColunas;


  Salas();



  String get NumeroDaSala => _NumeroSala;

  set NumeroDaSala(String value) {
    _NumeroSala = value;
  }

  String get TipoSala => _TipoSala;

  set TipoSala (String value) {
    _TipoSala = value;
  }

  String get NumeroLinhas => _NumeroLinhas;

  set NumeroLinhas (String value) {
    _NumeroLinhas = value;
  }
  String get NumeroColunas => _NumeroColunas;

  set NumeroColunas (String value) {
    _NumeroColunas = value;
  }
}