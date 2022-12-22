import 'dart:math';

import 'package:projeto/projeto.dart';
import 'package:test/test.dart';

void main() {
  // Testes em variáveis!
  test('Converter strig em Lista', () {
    String string = 'Diana,Erica,Helena,Rene';
    expect(
      string.split(','),
      ['Diana', 'Erica', 'Helena', 'Rene'],
    );
  });

// Testes em funções
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('converter em lista', () {
    expect(converterEmLista('Rene Fernando Lins Pereira de Souza'),
        ['Rene', 'Fernando', 'Lins', 'Pereira', 'de', 'Souza']);
  });

  test('converter em lista', () {
    expect(converterEmLista('Rene Fernando Lins Pereira de Souza'),
        ['Rene', 'Fernando', 'Lins', 'Pereira', 'de', 'Souza']);
  });

  group('maioridade', () {
    test('função maioridade deve retornar adulto quando passada idade > 17',
        () {
      String maturidade = maioridade(34);
      expect(maturidade, 'Adulto');
    });

    test(
        'função maioridade deve retornar adolescente quando passada idade > 13 e < 18',
        () {
      String maturidade = maioridade(14);
      expect(maturidade, 'Adolescente');
    });

    test(
        'função maioridade deve retornar criança quando passada idade > 3 e < 13',
        () {
      String maturidade = maioridade(13);
      expect(maturidade, 'Criança');
    });

    test('função maioridade deve retornar criança quando passada idade <= 3',
        () {
      String maturidade = maioridade(3);
      expect(maturidade, 'Bebê');
    });

    test('função maioridade não pode receber valores negativos', () {
      expect(() => maioridade(-3), throwsA(isA<ArgumentError>()));
    });
  });
}
