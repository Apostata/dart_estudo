// Mixin on
// define que um mixin está vinculado a uma classe expecífica e quem não herda desta classe não poderá usa-lo

abstract class Artista {
  void acao() {
    print('performista');
  }
}

mixin Cantor on Artista {
  void acao() {
    print('cantar');
  }
} //somente uma classe que herde de Artista pode ter o mixin cantor

abstract class Acao {
  void executar();
}

// classes concretas
class Dancarino {
  void acao() {
    print('Dancar');
  }
}

class Musico extends Artista with Dancarino, Cantor implements Acao {
  void acao() => print('compoe');

  @override
  void executar() {
    super.acao();
    acao();
  }
}

// classe MC não pode ter o mixin Cantor pois não herda de Artista
class MC with Dancarino implements Acao {
  void acao() {
    print('Bota o som DJ');
  }

  @override
  void executar() {
    super.acao();
    acao();
  }
}

void main(List<String> args) {
  Musico musico = Musico();
  musico.executar();

  print('');

  MC mc = MC();
  mc.executar();
}
