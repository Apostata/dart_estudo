class GEO {
  String lat;
  String lng;

  GEO({required this.lat, required this.lng});

  GEO.fromJson(Map<String, dynamic> json)
      : this(
          lat: json['lat'],
          lng: json['lng'],
        );
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  @override
  String toString() {
    return 'Instance of GEO: {'
        'lat:$lat'
        'lng:$lng'
        '}';
  }
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  GEO geo;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  Address.fromJson(Map<String, dynamic> json)
      : this(
          street: json['street'],
          suite: json['suite'],
          city: json['city'],
          zipcode: json['zipcode'],
          geo: GEO.fromJson(json['geo']),
        );

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo.toJson(),
    };
  }

  @override
  String toString() {
    return 'Instance of Address: {'
        'street: $street,'
        'suite: $suite,'
        'city: $city,'
        'zipcode: $zipcode,'
        'geo: ${geo.toString()},'
        '}';
  }
}

// Address
//    {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": $Geo
//     },


// GEO
//      {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
