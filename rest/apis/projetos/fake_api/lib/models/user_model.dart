import 'package:fake_api/models/address_model.dart';
import 'package:fake_api/models/company_model.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  Company company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.company});

  User.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
          username: json['username'],
          email: json['email'],
          address: Address.fromJson(json['address']),
          phone: json['phone'],
          company: Company.fromJson(json['company']),
        );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address.toJson(),
      'phone': phone,
      'company': company.toJson(),
    };
  }

  @override
  String toString() {
    return 'Instance of User : {'
        'id: $id,'
        'name: $name,'
        'username: $username,'
        'email: $email,'
        'address: ${address.toString()},'
        'phone: $phone,'
        'company: ${company.toString()},'
        '}';
  }
}

// {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": $AddressModel
//     "phone": "1-770-736-8031 x56442",
//     "website": "hildegard.org",
//     "company": $CompanyModel
//   },
