class Account {
  String? id;
  String? username;
  String? email;
  String? phone;
  String? password;

  Account({this.id, this.username, this.email, this.phone, this.password});

  Account.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "phone": phone,
        "password": password,
      };
}
