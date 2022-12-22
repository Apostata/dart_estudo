/*
- Stream é uma forma de monitorar eventos. Ao adicionar eventos na stream os ouvintes(listeners) serão notificados!
> são assíncronas Podemos usar await() ou listen() para processa-las
> streams são do tipo subscription(assinatura única) ou broadcast(transmissão para vários listeners)
Stream é uma sequencia com varias futures! ao invés de objter um evento solicitado(Future), a stream notifica que há um evento quando está pronto

* stream
- Fluxo que a classe StreamController() está gerenciando

* add()
- Adiciona eventos na stream, notificando assim seus listeners

* listen()
- Inscreve um listener na stream para que esse passe a receber suas notificações
> onData: notifica o listener com eventos de dados da stream, se for nulo, nada acontece
> onError: Tratamento de eventos com erro e possivel rastreamento de stacktrace. Se omitidos, serão considerados exceptions
> onDone: Evento é chamado quando a stream é fechada
> cancelOnError: A assinatura é cancelada automáticamente ao receber um evento erro!
 */

import 'dart:async';

conceito() {
  List<dynamic> list = [];

  // 1) setar o controlador
  var controlador = StreamController<dynamic>();

  // 2) stream
  var stream = controlador.stream;

  // 3) inscrever ouvintes
  stream.listen(
    (event) {
      print('evento: $event');
      list.add(event);
    },
    onDone: () {
      print('onDone');
      print(list);
    },
  );

  // 4) adicionar evento na stream
  controlador.sink.add('Rene');
  controlador.sink.add(33);
  controlador.sink.add(1.85);
  controlador.sink.add(!false);
  controlador.close();

  print('monitorando!');
}

// model
class Contador {
  int _contagem = 1, termino, erro;
  final _controlador = StreamController<int>();

  Sink<int> get sink =>
      _controlador.sink; // não expor o controlador, expor a interface
  Stream<int> get stream => _controlador.stream;

  Contador({this.termino = 5, this.erro = 3}) {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      _contagem < termino ? sink.add(_contagem) : sink.close();
      _contagem++;
      if (_contagem == erro) _controlador.addError('Erro intencional');
      if (_contagem > termino) timer.cancel();
    });
  }
}

model() {
  //criação da stream
  var minhaStream = Contador(termino: 5, erro: 3).stream;

  //inscricao
  final inscrito1 = minhaStream.listen(
    (onData) => print('inscrito1: $onData'),
    onError: (erro) => print('inscrito1 erro: $erro'),
    cancelOnError: false,
    onDone: () => print('inscrito1: completo!'),
  );

  //Adicionando ouvintes
  // final inscrito2 = minhaStream.listen(
  //   (event) {
  //     print('incrito2: $event');
  //   },
  // );
  // var dar erro pois se não for tratada como broadcast só aceita um ouvinte
}

model2() {
  //criação da stream como broadcast
  var minhaStream = Contador(termino: 5, erro: 3).stream.asBroadcastStream();

  //inscricao
  final inscrito1 = minhaStream.listen(
    (onData) => print('inscrito1: $onData'),
    onError: (erro) => print('inscrito1 erro: $erro'),
    cancelOnError: false,
    onDone: () => print('inscrito1: completo!'),
  );

  var pares = (e) => e % 2 == 0;
  var mapear = (e) => '$e é par';

  // Adicionando ouvinte e modificando eventos
  final inscrito2 = minhaStream.where(pares).map(mapear).listen(
    (event) {
      print('incrito2: $event');
    },
    onError: (erro) => print('incrito2 erro: $erro'),
    cancelOnError: false,
    onDone: () => print('incrito2: completo!'),
  );

  // gerenciar inscritos de acordo com certa ocorrência
  for (var i = 1; i <= 3; i++) {
    Future.delayed(Duration(seconds: i), () {
      if (i == 1) {
        inscrito1.pause();
      }
      if (i == 2) {
        inscrito1.resume();
      }
      if (i == 3) {
        inscrito1.cancel();
      }
    });
  }
}

//métodos e ouvintes
metodos() async {
  //criar stream diretamente
  var stream = Stream<dynamic>.periodic(
    Duration(seconds: 1),
    (e) => e + 1,
  ).take(5).asBroadcastStream();

  stream.listen(
    (event) {
      print('listen: $event');
    },
    onDone: () => print('Contagem finalizada'),
  );

  stream.forEach(
    //só de percorrer a lista cria um novo ouvinte então devemos mudar para broadcast
    (element) {
      print('Foreach; $element');
    },
  );

  await for (dynamic evento in stream) {
    print('For in: $evento');
  }
}

metodos2() async {
  //criar stream diretamente
  var stream = Stream<dynamic>.periodic(
    Duration(seconds: 1),
    (e) => e + 1,
  ).take(5).asBroadcastStream();

  stream.listen(
    (event) {
      print('listen: $event');
    },
    onDone: () => print('Contagem finalizada'),
  );

  var eventos = await stream.toList();
  print(eventos);
}

metodos3() async {
  //criar stream diretamente
  var stream = Stream<dynamic>.periodic(
    Duration(seconds: 1),
    (e) => e + 1,
  ).take(5).asBroadcastStream();

  stream.listen(
    (event) {
      print('listen: $event');
    },
    onDone: () => print('Contagem finalizada'),
  );

  var eventosFuturos = stream.toList();
  print(await eventosFuturos);
}

modificaEventos() {
  var stream = Stream<dynamic>.periodic(
    Duration(seconds: 1),
    (e) => e + 1,
  ).take(5).asBroadcastStream();

  stream = stream
      .takeWhile(
        (e) => e <= 5,
      )
      .skipWhile(
        (e) => e > 3,
      )
      .take(3)
      .map(
        (e) => e.toString().padLeft(2, '0'),
      );

  stream.listen(
    (event) {
      print('listen: $event');
    },
    onDone: () => print('Contagem finalizada'),
  );
}

void main(List<String> args) {
  // conceito();
  // model();
  // model2();
  // metodos();
  // metodos2();
  // metodos3();
  modificaEventos();
}
