class RegistrationResponse {
  RegistrationResponse({
    this.message,
    this.user,
    this.isNewlyRegistered,
    this.otp,});

  RegistrationResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? RegistrationUser.fromJson(json['user']) : null;
    isNewlyRegistered = json['is_newly_registered'];
    otp = json['otp'];
  }
  String? message;
  RegistrationUser? user;
  int? isNewlyRegistered;
  dynamic otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['is_newly_registered'] = isNewlyRegistered;
    map['otp'] = otp;
    return map;
  }

}

class RegistrationUser {
  RegistrationUser({
    this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.fcmToken,
    this.createdAt,
    this.updatedAt,
    this.profileInformation,});

  RegistrationUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileInformation = json['profile_information'] != null ? ProfileInformation.fromJson(json['profile_information']) : null;
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

class ProfileInformation {
  ProfileInformation({
    this.id,
    this.userId,
    this.profilePicture,
    this.isPremium,
    this.createdAt,
    this.updatedAt,});

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