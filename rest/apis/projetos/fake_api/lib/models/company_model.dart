//    {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered client-server neural-net",
//       "bs": "harness real-time e-markets"
//     }

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  Company.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'],
          catchPhrase: json['catchPhrase'],
          bs: json['bs'],
        );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  @override
  String toString() {
    return 'Instance of Company:{'
        'name: $name,'
        'catchPhrase: $catchPhrase,'
        'bs: $bs,'
        '}';
  }
}
