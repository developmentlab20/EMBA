class LoginResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;
  String? jwtToken;
  String? s3Url;

  LoginResponse(
      {this.status,
        this.error,
        this.message,
        this.data,
        this.jwtToken,
        this.s3Url});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    jwtToken = json['jwtToken'];
    s3Url = json['s3Url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['jwtToken'] = this.jwtToken;
    data['s3Url'] = this.s3Url;
    return data;
  }
}

class Data {
  String? sId;
  bool? isActive;
  String? email;
  String? fullname;
  String? role;
  String? school;
  String? college;
  String? tokenCreatedAt;
  bool? profileVerified;
  bool? profileCreated;
  dynamic status;
  String? linkedInUrl;
  bool? isAdmin;
  List<Null>? nonMITContact;
  int? rewardPoints;
  bool? enableCareerpath;
  bool? enableTest;
  bool? isSetLocation;
  List<Null>? secondaryUserIndustry;
  List<Null>? secondaryUserJobroles;
  bool? isAppUser;
  List<Null>? muteNotificationUsers;
  List<Null>? muteNotificationGroups;
  List<String>? interests;
  List<Null>? rewardDescriptions;
  List<Null>? redeemedrewards;
  String? createdAt;
  String? updatedAt;
  String? otpCreatedAt;
  String? rcode;
  String? verifyToken;
  List<Null>? subscribedGroups;

  Data(
      {this.sId,
        this.isActive,
        this.email,
        this.fullname,
        this.role,
        this.school,
        this.college,
        this.tokenCreatedAt,
        this.profileVerified,
        this.profileCreated,
        this.status,
        this.linkedInUrl,
        this.isAdmin,
        this.nonMITContact,
        this.rewardPoints,
        this.enableCareerpath,
        this.enableTest,
        this.isSetLocation,
        this.secondaryUserIndustry,
        this.secondaryUserJobroles,
        this.isAppUser,
        this.muteNotificationUsers,
        this.muteNotificationGroups,
        this.interests,
        this.rewardDescriptions,
        this.redeemedrewards,
        this.createdAt,
        this.updatedAt,
        this.otpCreatedAt,
        this.rcode,
        this.verifyToken,
        this.subscribedGroups});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isActive = json['isActive'];
    email = json['email'];
    fullname = json['fullname'];
    role = json['role'];
    school = json['school'];
    college = json['college'];
    tokenCreatedAt = json['tokenCreatedAt'];
    profileVerified = json['profileVerified'];
    profileCreated = json['profileCreated'];
    status = json['status'];
    linkedInUrl = json['linkedInUrl'];
    isAdmin = json['isAdmin'];
    rewardPoints = json['rewardPoints'];
    enableCareerpath = json['enableCareerpath'];
    enableTest = json['enableTest'];
    isSetLocation = json['isSetLocation'];
    isAppUser = json['isAppUser'];
    interests = json['interests'].cast<String>();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    otpCreatedAt = json['otpCreatedAt'];
    rcode = json['rcode'];
    verifyToken = json['verifyToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isActive'] = this.isActive;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['role'] = this.role;
    data['school'] = this.school;
    data['college'] = this.college;
    data['tokenCreatedAt'] = this.tokenCreatedAt;
    data['profileVerified'] = this.profileVerified;
    data['profileCreated'] = this.profileCreated;
    data['status'] = this.status;
    data['linkedInUrl'] = this.linkedInUrl;
    data['isAdmin'] = this.isAdmin;
    data['rewardPoints'] = this.rewardPoints;
    data['enableCareerpath'] = this.enableCareerpath;
    data['enableTest'] = this.enableTest;
    data['isSetLocation'] = this.isSetLocation;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['otpCreatedAt'] = this.otpCreatedAt;
    data['rcode'] = this.rcode;
    data['verifyToken'] = this.verifyToken;
    return data;
  }
}
