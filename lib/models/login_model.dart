class LoginModel {
  late String token;
  late String email;
  late String userName;

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    userName = json['userName'];
  }
}

