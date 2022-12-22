import 'dart:math';

class Pessoa {
  String nome, sobrenome;
  late int _identidade;

  Pessoa(this.nome, this.sobrenome, {int? identidade = null}) {
    this._identidade =
        (identidade == null) ? Random().nextInt(99999999) : identidade;
  }

  get identidade => this._identidade;
}

class Venda {
  String produto;
  double preco;
  Venda(this.produto, this.preco);
}

class Vendedor {
  String nome;
  List<Venda> vendas;
  Vendedor(this.nome, this.vendas);
}

// carros

void main(List<String> args) {
  Pessoa pessoa1 = Pessoa('Rene', 'Souza');
  Pessoa pessoa2 = Pessoa('Erica', 'Souza', identidade: 8754321);

  List<Pessoa> pessoas = [pessoa1, pessoa2];
  pessoas.add(Pessoa('Helena', 'Souza'));

  pessoas.forEach((pessoa) {
    print('for: ${pessoa.nome}, ${pessoa.sobrenome}, ${pessoa.identidade}');
  });

  List<Vendedor> vendedores = [];
  vendedores
    ..add(
      Vendedor(
        'Rene',
        [
          Venda('PC gammer', 6500.77),
          Venda('Monitor', 2320.77),
        ],
      ),
    )
    ..add(
      Vendedor(
        'Erica',
        [
          Venda('Microphone sure', 1003.44),
          Venda('Piano Eletronico', 5303.87),
          Venda('Piano Eletronico', 2667.94),
        ],
      ),
    );

  double totalVendas(Vendedor vendedor) =>
      vendedor.vendas.fold(0.0, (anterior, atual) => anterior + atual.preco);

  // organizar a lista de vendas pela soma total
  vendedores.sort(
    (b, a) => totalVendas(a).compareTo(
      totalVendas(b),
    ),
  );

  print('');
  vendedores.forEach((vendedor) => {
        print(
            'Vendedor #${vendedor.nome}\t ${vendedor.vendas.length} totalizando \t ${totalVendas(vendedor)} ')
      });
}
