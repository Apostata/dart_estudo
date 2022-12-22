typedef Aluno = Map<String, dynamic>;
typedef Funcionario = Aluno;

void mapReduce() {
  List<Aluno> alunos = [
    {'nome': 'Rene', 'nota': 7.3, 'bolsista': false},
    {'nome': 'Erica', 'nota': 9.3, 'bolsista': true},
    {'nome': 'Helena', 'nota': 8.9, 'bolsista': true},
    {'nome': 'Diana', 'nota': 8.7, 'bolsista': false},
  ];

  final bool Function(Map) ehBolsista = (aluno) => aluno['bolsista'];
  final String Function(Map) getNome = (aluno) => aluno['nome'];
  final double Function(Map) nota = (aluno) => aluno['nota'];
  final double Function(double, double) soma = (num1, num2) => num1 + num2;

  List<String> bolsistas = alunos.where(ehBolsista).map(getNome).toList();
  double mediaBolsistas = alunos
          .where(ehBolsista)
          .map(nota)
          .reduce((anterior, atual) => anterior + atual) /
      bolsistas.length;

  bool saoTodosBolsistas = alunos.every(ehBolsista);
  // bool saoTodosBolsistas =
  //     alunos.map(ehBolsista).reduce((ant, cur) => ant && cur);

  bool algumEhBolsistas = alunos.any(ehBolsista);
  // bool algumEhBolsistas =
  //     alunos.map(ehBolsista).reduce((ant, cur) => ant || cur);
  print(bolsistas);
  print(mediaBolsistas);
  print(saoTodosBolsistas);
  print(algumEhBolsistas);

  List<Funcionario> funcionarios = [
    {'nome': 'Rene', 'genero': 'M', 'pais': 'Brasil', 'salario': 1289.23},
    {'nome': 'Erica', 'genero': 'F', 'pais': 'Argentina', 'salario': 1578.98},
    {'nome': 'Helena', 'genero': 'F', 'pais': 'Brasil', 'salario': 1763.12},
    {'nome': 'Diana', 'genero': 'F', 'pais': 'Brasil', 'salario': 1864.83},
    {'nome': 'Fabio', 'genero': 'M', 'pais': 'Argentina', 'salario': 1762.56},
  ];

  bool Function(Funcionario) ehBrasileiro =
      (funcionario) => funcionario['pais'] == 'Brasil';
  bool Function(Funcionario) ehMulher =
      (funcionario) => funcionario['genero'] == 'F';
  double Function(Funcionario) getSalario =
      (funcionario) => funcionario['salario'];

  double Function(double, double) menorSalario =
      (salario1, salario2) => salario1 < salario2 ? salario1 : salario2;

  Funcionario Function(Funcionario, Funcionario) funcionarioMenoSalario =
      (funcionario1, funcionario2) =>
          funcionario1['salario'] < funcionario2['salario']
              ? funcionario1
              : funcionario2;

  List<Funcionario> brasileiras =
      funcionarios.where(ehBrasileiro).where(ehMulher).toList();

  print(brasileiras);

  Funcionario menorSalarioFuncionarios =
      funcionarios.reduce(funcionarioMenoSalario);

  double menorSalarioTodos = funcionarios.map(getSalario).reduce(menorSalario);

  print(menorSalarioFuncionarios);
  print(menorSalarioTodos);
}

void main(List<String> args) {
  mapReduce();
}
