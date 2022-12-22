import 'classes/animal_model.dart';
import 'classes/pessoa_model.dart';
import 'classes/usuario_model.dart';

void main(List<String> args) {
  Animal nina = Animal('Nina', 'Tomba lata', 2);
  print('Nome:${nina.nome}, raça:${nina.raca}, idade:${nina.idade}');

  Person pessoa = Person('Rene', 33);
  print(
      'Nome:${pessoa.nome}, idade:${pessoa.idade}, peso:${pessoa.peso}, altura:${pessoa.altura}');

  final user = User('eu', 'pass');
  final admin = User.Admin('someAdmin', 'passadmin');
  print('${user.user} ${user.nome} ${user.cargo}');
  print('${admin.user} ${admin.nome} ${admin.cargo}');
}
