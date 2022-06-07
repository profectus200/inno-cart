class ApiUser {
  final String name;
  final String surname;
  final String email;
  final int phoneNumber;
  final double rating;

  ApiUser.fromApi(Map<String, dynamic> map)
      : name = map['results']['name'],
        surname = map['results']['surname'],
        email = map['results']['email'],
        phoneNumber = map['results']['phoneNumber'],
        rating = map['results']['rating'];
}
