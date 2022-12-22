/*
  * Conceito
  utf8
  - binário que representa qualquer caractere universal

  Base64
  - codificação de dados para transferência na Internet
  - https:// www.base64encode.org/
*/
import 'dart:convert';

void main(List<String> args) {
  String email = 'rs@gmail.com';

  //Encode
  List<int> ebytes = utf8.encode(email);
  String codificado = base64.encode(ebytes);
  print('String email $email to List<int> bytes :$ebytes');
  print('List<int> bytes $ebytes to String Base64:$codificado');
  print('');
  //Decode
  List<int> dbytes = base64.decode(codificado);
  String decodificado = utf8.decode(dbytes);
  print('String Base64 $codificado to List<int> bytes $dbytes');
  print('List<int> bytes $dbytes to String email: $decodificado');
}
