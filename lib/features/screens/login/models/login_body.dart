class LoginBody {
  LoginBody({
    String? email,
    String? phone,
    String? password,
  }) {
    _email = email;
    _phone = phone;
    _password = password;
  }

  LoginBody.fromJson(dynamic json) {
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
  }

  String? _email;
  String? _phone;
  String? _password;

  String? get email => _email;

  String? get phone => _phone;

  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    return map;
  }
}
