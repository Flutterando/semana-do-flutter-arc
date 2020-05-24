class AuthModel {
  String email;
  String password;

  AuthModel({this.email, this.password});

  @override
  String toString() {
    return "email: $email | password: $password";
  }
}
