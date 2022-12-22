/* Then - registra um callback para ser executado quando a future for concluida
  > onValue: valor passdo ao termino da Future
  > catchError: Se omitido é lancado como uma exceção
    >test: verifica se lançara uma exceção ou se é um erro tratado
  > whenComplete chama uma função anonima ao termino da future 
*/

//funções assyncronas

Future<String> tarefa({int tempo = 1}) {
  return status(tempo).then((msg) {
    return '\nstatus $msg';
  }).catchError((onError) {
    return onError;
  }, test: (error) {
    return error is String;
  }).whenComplete(() => print('Future Completa'));
}

Future<String> status(tempo) {
  return Future.delayed(
    Duration(seconds: tempo),
    // () => 'Primeira tarefa finalizada!',
    () => Future.error('Erro intencional!'),
  );
}

//Função syncrona
void contagem({int segundos = 3}) {
  print('carregando ...\n');
  for (int i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print(i);
      if (i == segundos) print('conluido!');
    });
  }
}

void main(List<String> args) {
  contagem(segundos: 3);
  tarefa(tempo: 2).then((onValue) => print(onValue));
}
