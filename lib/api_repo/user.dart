class User {

  String firstName;
  String lastName;
  String email;


  User({
    this.firstName,
    this.lastName,
    this.email,


  });

  User.fromJson(Map<String, dynamic> data)
      :
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'];
}

