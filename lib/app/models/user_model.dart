class UserModel {
  final String name;
  final String email;
  final String nickname;
  final String picture;

  UserModel({this.name, this.email, this.nickname, this.picture});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      picture: json['picture'],
      email: json['email'],
      nickname: json['nickname'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['email'] = this.email;
    data['nickname'] = this.nickname;
    return data;
  }
}
