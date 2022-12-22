/// * Assert
/// - usa lógica booleana para testar afirmações no modo debug
/// try/ catch pode ser usado para tratar exceções
///
/// * Test
/// precisa do pacote test em dev_dependencies no pubspac.yaml
/// atualizar o pubspec.yaml com o commando `pub get`
/// execute os testes na pasta raiz com o comando `pub run test`
/// podemos testar variaveis, funções e testes em grupos
///
/// *sintaxe
/// test('descrição' (){
///   expect(valorTestado, valorEsperado)
/// });
///

import 'package:projeto/projeto.dart' as projeto;

void main(List<String> arguments) {
  print('Hello world: ${projeto.calculate()}!');

  try {
    String? texto;
    assert(texto != null, 'texto não pode ser nulo!');
    String telefone = '123456789';
    assert(telefone.length == 9, 'O telefone deve conter 9 dígitos');
  } catch (e) {
    print('Exceção: $e');
    throw (Exception(e));
  }
}
