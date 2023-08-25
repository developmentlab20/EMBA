class GetProfileResponse {
  int? status;
  bool? error;
  ProfileData? data;
  String? message;

  GetProfileResponse({this.status, this.error, this.data, this.message});

  GetProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? new ProfileData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class ProfileData {
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
  int? status;
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
  EducationDetails? educationDetails;
  List<OrganizationDetails>? organizationDetails;
  NetworkingDetails? networkingDetails;
  List<String>? interests;
  bool? isDeleted;
  List<Null>? rewardDescriptions;
  List<Null>? redeemedrewards;
  String? createdAt;
  String? updatedAt;
  int? otp;
  String? otpCreatedAt;
  String? rcode;
  String? description;
  List<Null>? subscribedGroups;
  int? totalConnections;
  int? totalPosts;
  int? totalGroups;
  int? totalJobs;

  ProfileData(
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
        this.educationDetails,
        this.organizationDetails,
        this.networkingDetails,
        this.interests,
        this.isDeleted,
        this.rewardDescriptions,
        this.redeemedrewards,
        this.createdAt,
        this.updatedAt,
        this.otp,
        this.otpCreatedAt,
        this.rcode,
        this.description,
        this.subscribedGroups,
        this.totalConnections,
        this.totalPosts,
        this.totalGroups,
        this.totalJobs});

  ProfileData.fromJson(Map<String, dynamic> json) {
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
    educationDetails = json['educationDetails'] != null
        ? new EducationDetails.fromJson(json['educationDetails'])
        : null;
    if (json['organizationDetails'] != null) {
      organizationDetails = <OrganizationDetails>[];
      json['organizationDetails'].forEach((v) {
        organizationDetails!.add(new OrganizationDetails.fromJson(v));
      });
    }
    networkingDetails = json['networkingDetails'] != null
        ? new NetworkingDetails.fromJson(json['networkingDetails'])
        : null;
    interests = json['interests'].cast<String>();
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    otp = json['otp'];
    otpCreatedAt = json['otpCreatedAt'];
    rcode = json['rcode'];
    description = json['description'];
    totalConnections = json['totalConnections'];
    totalPosts = json['totalPosts'];
    totalGroups = json['totalGroups'];
    totalJobs = json['totalJobs'];
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
    data['isAppUser'] = this.isAppUser;
    if (this.educationDetails != null) {
      data['educationDetails'] = this.educationDetails!.toJson();
    }
    if (this.organizationDetails != null) {
      data['organizationDetails'] =
          this.organizationDetails!.map((v) => v.toJson()).toList();
    }
    if (this.networkingDetails != null) {
      data['networkingDetails'] = this.networkingDetails!.toJson();
    }
    data['interests'] = this.interests;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['otp'] = this.otp;
    data['otpCreatedAt'] = this.otpCreatedAt;
    data['rcode'] = this.rcode;
    data['description'] = this.description;
    data['totalConnections'] = this.totalConnections;
    data['totalPosts'] = this.totalPosts;
    data['totalGroups'] = this.totalGroups;
    data['totalJobs'] = this.totalJobs;
    return data;
  }
}

class EducationDetails {
  String? collegeName;
  String? schoolName;
  String? graduationYear;
  String? program;

  EducationDetails(
      {this.collegeName, this.schoolName, this.graduationYear, this.program});

  EducationDetails.fromJson(Map<String, dynamic> json) {
    collegeName = json['collegeName'];
    schoolName = json['schoolName'];
    graduationYear = json['graduationYear'];
    program = json['program'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collegeName'] = this.collegeName;
    data['schoolName'] = this.schoolName;
    data['graduationYear'] = this.graduationYear;
    data['program'] = this.program;
    return data;
  }
}

class OrganizationDetails {
  String? jobTitle;
  String? companyName;
  String? jobLevel;
  String? industry;
  String? jobFunction;

  OrganizationDetails(
      {this.jobTitle,
        this.companyName,
        this.jobLevel,
        this.industry,
        this.jobFunction});

  OrganizationDetails.fromJson(Map<String, dynamic> json) {
    jobTitle = json['jobTitle']??'';
    companyName = json['companyName']??'';
    jobLevel = json['jobLevel']??'';
    industry = json['industry']??'';
    jobFunction = json['jobFunction']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jobTitle'] = this.jobTitle;
    data['companyName'] = this.companyName;
    data['jobLevel'] = this.jobLevel;
    data['industry'] = this.industry;
    data['jobFunction'] = this.jobFunction;
    return data;
  }
}

class NetworkingDetails {
  String? lookingFor;
  String? helpOther;
  List<String>? additionalExperience;
  List<String>? additionalSkills;

  NetworkingDetails(
      {this.lookingFor,
        this.helpOther,
        this.additionalExperience,
        this.additionalSkills});

  NetworkingDetails.fromJson(Map<String, dynamic> json) {
    lookingFor = json['lookingFor'];
    helpOther = json['helpOther'];
    additionalExperience = json['additionalExperience'].cast<String>();
    additionalSkills = json['additionalSkills'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lookingFor'] = this.lookingFor;
    data['helpOther'] = this.helpOther;
    data['additionalExperience'] = this.additionalExperience;
    data['additionalSkills'] = this.additionalSkills;
    return data;
  }
}
