import 'dart:convert';

import 'package:fake_api/models/user_model.dart';
import 'package:http/http.dart';

jsonGet() async {
  String url = 'https://jsonplaceholder.typicode.com/users';

  try {
    Uri uri = Uri.parse(url);
    Response response = await get(uri);
    if (response.statusCode != 200) {
      throw Exception('Erro ${response.statusCode}');
    } else {
      //Decode
      List<Map<String, dynamic>> parsedJson =
          List<Map<String, dynamic>>.from(jsonDecode(response.body));
      List<User> usuarios =
          parsedJson.map((usuario) => User.fromJson(usuario)).toList();
      print(usuarios);

      //Encode
      List<Map<String, dynamic>> mapUsers =
          usuarios.map((user) => user.toJson()).toList();
      String encodeJson = jsonEncode(mapUsers);
      print(encodeJson);
    }
  } catch (e) {
    print(e);
  }
}

jsonPost() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Map<String, dynamic> postagem = {
    "userId": 1,
    "title": "Uma nova postagem",
    "body": "É só pra ver se rola mesmo"
  };

  String encodeJson = jsonEncode(postagem);

  try {
    Uri uri = Uri.parse(url);
    Response response = await post(uri,
        headers: {'Content-type': 'application/json; charset=UTF-8'},
        body: encodeJson);
    if (response.statusCode != 201) {
      throw Exception(
          'Erro ao salvar postagem, Status code:${response.statusCode}');
    } else {
      print(response.statusCode);
      print(response.body);
    }
  } catch (e) {
    print(e);
  }
}

void main(List<String> args) {
  jsonGet();
  jsonPost();
}
