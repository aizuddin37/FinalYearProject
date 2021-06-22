class User {
  int idUser;
  String firstName;
  String lastName;
  String email;


  User({this.idUser,
    this.firstName,
    this.lastName,
    this.email,


  });

  User.fromJson(Map<String, dynamic> data)
      : idUser = data['idUser'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'];
}

