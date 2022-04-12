class Filmes{
  late String _NomeDoFilme;
  late String _DataLancamento;
  late String _Duracao;
  late String _RestricaoDeIdade;
  late String _Genero;
  late String _Sinopse;
  late String _Url;

  Filmes();

  String get Sinopse => _Sinopse;

  set Sinopse(String value){
    _Sinopse = value;
  }
  String get Url => _Url;

  set Url(String value){
    _Url = value;
  }

  String get NomeDoFilme => _NomeDoFilme;

  set NomeDoFilme(String value) {
    _NomeDoFilme = value;
  }

  String get DataLancamento => _DataLancamento;

  set DataLancamento (String value) {
    _DataLancamento = value;
  }

  String get Duracao => _Duracao;

  set Duracao (String value) {
    _Duracao = value;
  }
  String get RestricaoDeIdade => _RestricaoDeIdade;

  set RestricaoDeIdade (String value) {
    _RestricaoDeIdade = value;
  }
  String get Genero => _Genero;

  set Genero (String value) {
    _Genero = value;
  }
}