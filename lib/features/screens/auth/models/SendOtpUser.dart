class SendOtpUser {
  SendOtpUser({
    this.message,
    this.user,
  });

  SendOtpUser.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  String? message;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? emailVerifiedAt;
  String? role;
  dynamic fcmToken;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['role'] = role;
    map['fcm_token'] = fcmToken;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
