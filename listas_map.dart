// Cria uma nova coleção de mesmo tamanho a partir de outra, selecionando ou transformando os elementos

void listMap() {
  List<String> frutas = ['Morangos', 'Banana', 'Tomate'];
  List<String> frutasMapeadas =
      frutas.map((fruta) => '$fruta é uma fruta').toList();
  print('Lista de frutas: $frutas');
  print('Lista de frutasMapeadas: $frutasMapeadas');

  List<int> inteiros = [1, 5, 10];
  List<double> doubles = [2.75, 5.5, 7.25];

  final int Function(int) incrementar = (item) => ++item;
  final int Function(int) dobro = (item) => item * 2;
  final num Function(num) triplo = (item) => item * 3;
  final String Function(num) toCurrency = (item) =>
      'R\$ ${item.toDouble().toStringAsFixed(2).replaceFirst('.', ',')}';
  final num Function(num) Function(num) porcentagem =
      (desconto) => (valor) => desconto * valor; //closure

  List<int> inteirosMapeados = inteiros.map(incrementar).map(dobro).toList();

  List<dynamic> doublesMapeados =
      doubles.map(triplo).map(porcentagem(0.9)).map(toCurrency).toList();

  print('Lista de inteirosMapeados: $inteirosMapeados');
  print('Lista de doublesMapeados: $doublesMapeados');
}

void main(List<String> args) {
  listMap();
}
