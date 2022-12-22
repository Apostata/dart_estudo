import 'dart:async';

int contator = 0;
String agora() {
  DateTime tempo = DateTime.now();
  String hora =
      '${tempo.hour}:${tempo.minute}:${tempo.second}:${tempo.millisecond}:${tempo.microsecond}';
  return hora;
}

void main(List<String> args) {
  print('agora é ${agora()}');

  // Timer.run(() => 'agora é :${agora()}');
  // Timer(Duration(seconds: 2), () => print('2 segundos depois!'));
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (contator == 0) {
      print('iniciando as ${agora()}');
    }
    contator++;
    if (contator == 4) {
      print('depois de 4 segundos');
    }
    if (contator == 6) {
      print('finalizado em 6 segundos ${agora()}');
      timer.cancel();
    }
  });
}
