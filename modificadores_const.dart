import 'dart:math';

void main(List<String> args) {
  const pi = 3.14; //uma constante que não altera em tempo de execução
  double raio = 2;
  double resultado = pi * pow(raio, 2);
  print('ressultado: $resultado');

  final numeros = [raio, 2.5];
  numeros.add(resultado);
  print(numeros);

  final listaFinal = const [0, 1];
  // listaFinal.add(2);
  print(listaFinal);

  // const listaConst = [1, 2, pi, raio]; //erro pois raio é uma variavel mutavel em tempo de execução, só pode aceitar constantes
  Brasil br = Brasil(-15.792371, -47.882326);
  print(
      '\nobjeto: $br, capital:${Brasil.capital}, latitude:${br.lat}, longitudo ${br.lon}');
  print('Estados: ${Brasil.estados}');
}

class Brasil {
  final double lat;
  final double lon;
  static const String capital = 'Brasilia';
  static const List<String> estados = ['SP', 'RJ', 'MG', '...'];
  const Brasil(this.lat, this.lon);
}
