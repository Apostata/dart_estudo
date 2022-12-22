void main(List<String> args) {
  var porInferencia =
      2; // o tipo é definido por inferência, quando o valor é atribuido
  int numeroInteiro = 3;
  int inteiro1 = 1,
      inteiro2 = 3; // definindo duas variáveis de mesmo tipo de uma só vez
  double numeroDecimal = 2.4;
  num numero =
      3.5; // pode receber inteiro ou decimal, o tipo é definido por inferência, quando o valor é atribuido
  num numero2 = 3; // recebe inteiro ou decimal

  String texto = 'oples'; //uma sequencia de caracteres alphanuméricos
  bool boleana = true;
  DateTime data = DateTime(2022, 03, 30, 13, 45, 12, 213, 213);
  // DateTime(ano, mes, dia, hora, minutos, segundos, milisegundos, microsegundos);, somente ano é obrigatório
  dynamic coringa =
      'aceita qualquer tipo'; //desabilita a checkage de tipo inclusive null
  Object coringa2 =
      'aceita qualquer tipo'; //aceita qualquer tipo menos null, toda variavel extende de objeto em dart

// funções de variáveis
  //funções de conversões e transformações numéricas
  print(numero.floor()); //arredonda para baixo
  print(numero.round()); //arredonda para o inteiro mais próximo
  print(numero.ceil()); //arredonda para cima
  print(1.1.clamp(1.8,
      2.8)); //compara com mínimo igual 1.8 e máximo 2.8, no caso 1.1 é mais próximo de 1.8
  print(numero
      .compareTo(3)); // retorna -1 se é menor, 0 se for igual e 1 se for maior
  print(numero.remainder(3)); // divide numero por 3 e o resultado é o resto
  print(numero
      .toInt()); // transforma num ou double em int, remove as casas decimais
  print(numeroInteiro.toDouble()); //converte inteiro em double
  print(data.toString()); // tranforma em string,
  print(numero.toStringAsFixed(
      1)); // transforma em e seta o numéro máximo de casas decimais
  print(numero.truncate()); // descarta casas decimais
  print(numero.isNegative); // retorna boleano se é ou não negativo
  print((numero / 0).isInfinite); // retorna boleano se é ou não infinito
  print(12.gcd(16)); // retorna o MDC (máximo divisor comum)
  //funções de transformações de strings
  print(texto.toLowerCase()); //para caixa baixa
  print(texto.toUpperCase()); //para caixa alta
  print('\t $texto'.trim()); // remove espaços e tabulações
  print('Rene Fernando L P de Souza'.split(
      ' ')); // transforma a string em uma lista de strings separadas por espaço = [Rene, Fernando, L, P, de, Souza]
  print('Rene Fernando L P de Souza'.split(
      '')); // neste caso transforma todos os caracteres da string, incluindo os espaços = [R, e, n, e,  , F, e, r, n, a, n, d, o,  , L,  , P,  , d, e,  , S, o, u, z, a]
  print('Rene Fernando L P de Souza'.substring(
      5, 13)); // pega parte da string iniciando no indice 5 e indo até 13
  print(texto.startsWith('o')); //se a string inicia com a letra, case sensitive
  print('rene fernando'.startsWith(
      'fer', 5)); // se a partir do indice 5 a string inicia com 'fer'
  print('Teste'.replaceAll(
      'e', 'a')); // subistiui todas ocorrencias de 'e' por 'a' na string
  print('Reme'
      .replaceFirst('Re', 'Ti')); // substitui o inicio da string 'Re' por 'Ti'
  print('Rene'.replaceFirst('e', 'a',
      3)); // substitui o inicio da string 'e' por 'a' inciando no indice 3
  print('Renet'
      .replaceRange(1, 5, 'a')); // substitue do indice 1 até o 5 por 'a';
  print(texto.contains('o')); // se existe o caracter na string
  print(texto.contains(
      'o', 1)); // se exite o caractere na string a partir do indice 1
  print('Rene Souza'
      .indexOf('Souza')); // o indice da string onde se inicia a palavra 'Souza'
  print(texto
      .length); // retorna comprimento da lista ou string(lista de caracteres)
  print(texto.endsWith('s')); // se a string termina com 's'
  print('Rene'.compareTo(
      'Re')); // retorna 0 se é igual e -1 se não possui e 1 se possui; a comparação é feita pelo incio
  print(''.isEmpty); //se é uma string vazia
  print(double.parse('1.1')); // transforma string em double
  print(int.parse('1')); // transforma a string em int
  print('rene'
      .lastIndexOf('e')); // retorna o ultimo indice que possui o caractere 'e'
  print('1'.padLeft(2,
      '0,')); // define o tramanho da string para 2 e adiciona '0,'(como se fosse um único caracter) a esquerda até completar este tamanho
  print('1'.padRight(3,
      '.000')); // define o tramanho da string para 3 e adiciona '.000'(como se fosse um único caracter) a direita até completar este tamanho

  //boleanas
  print(numero is String);
  print(numero is int);
  print(numero is double);
  print(numero2 is int);
  print(numero2 is double);
}


// null-aware assingment. 
// seta o valor da variável a esquerda se ela estiver nula

// void main() {
//   int value;
//   print(value); // <- null
//   value ??= 5;
//   print(value); // <- 5, changed from null
//   value ??= 6;
//   print(value); // <- 5, no change
// }