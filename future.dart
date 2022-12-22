/*
 Future é o resultado de uma operação assíncrona,
 Operações syncronas: Bloqueia a execução até que seja concluida
 Operação assíncrona: Executa somente operação síncrona
 Await: indica a espera da operação assíncrona, que a future seja concluída
 Async: Deve se usado em toda função que esperem a execução com 'Await'
*/
Future<String> tarefa({int tempo = 1}) async {
  String msg = await status(tempo);
  return 'Status $msg';
}

status(tempo) {
  return Future.delayed(
      Duration(seconds: tempo), () => 'Primeira tarefa finalizada!');
}

void contagem({int segundos = 3}) {
  print('carregando ...\n');
  for (int i = 1; i <= segundos; i++) {
    Future.delayed(Duration(seconds: i), () {
      print(i);
      if (i == segundos) print('conluido!');
    });
  }
}

void main(List<String> args) async {
  print(await tarefa(tempo: 5));
  contagem(segundos: 6);
}
