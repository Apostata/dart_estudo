/*
Generators são funções geradora, produzem sequendia de valores usando :
> funções sincronas que retorna Iterable
> funções assíncronas que retornam Streams

* yield
> utilizada em ambas(sincronas e assíncronas)
> adiciona um valor ao fluxo de saida da função assincrona marcada com '*' retornando sem encerrar a função
COMO um return, mas continua a executar


*yield *
> utilizada em ambas(sincronas e assíncronas) recursivas
> melhora o desenpenho com yield* recursivo
*/

funcoesGeradoras() {
  Iterable<int> funcaoSync(int repeticaoMax) sync* {
    int i = 0;
    while (i < repeticaoMax) yield ++i;
  }

  Stream<int> funcaoAsync(int repeticaoMax) async* {
    int i = 0;
    while (i < repeticaoMax) yield ++i;
  }

  print('\nsync generator');
  funcaoSync(5).forEach(
    (element) {
      print(element);
    },
  );
  print('\nasync generator');
  funcaoAsync(5).forEach(
    (element) {
      print(element);
    },
  );
}

funcoesGeradorasRecursivas() {
  Iterable<int> funcaoSync(int repeticaoMax) sync* {
    if (repeticaoMax > 0) {
      yield repeticaoMax;
      yield* funcaoSync(repeticaoMax - 1);
    }
  }

  print(funcaoSync(3));

  Stream<int> funcaoASync(int repeticaoMax) async* {
    if (repeticaoMax > 0) {
      yield repeticaoMax;
      yield* funcaoASync(repeticaoMax - 1);
    }
  }

  funcaoASync(3).forEach(
    (element) {
      print(element);
    },
  );
}

tratamentoExcecoes() async {
  Future<int> streamSoma(Stream<int> stream) async {
    var soma = 0;
    try {
      await for (var valor in stream) {
        soma += valor;
      }
      return soma;
    } catch (e) {
      print(e);
      return -1;
    }
  }

  ;

  Stream<int> streamContagem(int termino, {int erro = 0}) async* {
    for (var i = 1; i <= termino; i++) {
      // yield i;
      if (i == erro) {
        throw Exception('Erro intencional');
      } else {
        yield i;
      }
    }
  }

  ;

  final Stream<int> stream = streamContagem(10, erro: 3);
  // print(stream);
  // stream.forEach((element) {
  //   print(element);
  // });

  print(await streamSoma(stream));
}

void main(List<String> args) {
  // funcoesGeradoras();
  // funcoesGeradorasRecursivas();
  tratamentoExcecoes();
}
