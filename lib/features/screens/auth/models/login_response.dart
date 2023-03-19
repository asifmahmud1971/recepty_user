class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.emailVerifiedAt,
    this.tokenType,
    this.expiresIn,
    this.user,
    this.profileInformation,
  });

  LoginResponse.fromJson(dynamic json) {
    accessToken = json['access_token'];
    emailVerifiedAt = json['email_verified_at'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    profileInformation = json['profile_information'] != null
        ? ProfileInformation.fromJson(json['profile_information'])
        : null;
  }

  String? accessToken;
  dynamic emailVerifiedAt;
  String? tokenType;
  int? expiresIn;
  User? user;
  ProfileInformation? profileInformation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['email_verified_at'] = emailVerifiedAt;
    map['token_type'] = tokenType;
    map['expires_in'] = expiresIn;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (profileInformation != null) {
      map['profile_information'] = profileInformation?.toJson();
    }
    return map;
  }
}

class ProfileInformation {
  ProfileInformation({
    this.id,
    this.userId,
    this.profilePicture,
    this.isPremium,
    this.createdAt,
    this.updatedAt,
  });

  ProfileInformation.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    profilePicture = json['profile_picture'];
    isPremium = json['is_premium'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? userId;
  dynamic profilePicture;
  dynamic isPremium;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['profile_picture'] = profilePicture;
    map['is_premium'] = isPremium;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    this.profileInformation,
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
    profileInformation = json['profile_information'] != null
        ? ProfileInformation.fromJson(json['profile_information'])
        : null;
  }

  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  dynamic emailVerifiedAt;
  String? role;
  dynamic fcmToken;
  String? createdAt;
  String? updatedAt;
  ProfileInformation? profileInformation;

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
    if (profileInformation != null) {
      map['profile_information'] = profileInformation?.toJson();
    }
    return map;
  }
}
