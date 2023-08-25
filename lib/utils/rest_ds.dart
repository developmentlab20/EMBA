import 'dart:async';
import 'dart:convert';
import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/utils/sharedpref/preferences.dart';

import '../model/bool_text.dart';
import '../model/get_collage_response.dart';
import '../model/get_interest_response.dart';
import '../model/get_program_model.dart';
import '../model/get_school_response.dart';
import '../model/get_skills_response.dart';
import '../model/login_response.dart';
import '../model/notification/get_notification_response.dart';
import '../model/profile/get_manage_contact_response.dart';
import '../model/profile/get_profile_response.dart';
import '../model/profile/profile_percentage_response.dart';
import '../model/set_prefrences/set_prefrences_response.dart';
import '../model/sucess_response.dart';
import '../model/signup_response.dart';
import '../model/term_condition_response.dart';
import 'network_util.dart';
import 'sharedpref/shared_prefrence.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  //Live Server
  static final BASE_URL = "http://34.227.163.51:9000/v1/";

 static final REGISTER_URL = BASE_URL + "users/signup";
 static final USER_EXITS_URL = BASE_URL + "users/available";
  static final LOGIN_URL = BASE_URL + "users/login";
  static final User_FORGOT_PASSWORD = BASE_URL + "users/forgotPassword";
  static final DELETE_USER = BASE_URL + "users/";
  static final USER_INTEREST = BASE_URL + "users/interest";
  static final LOGOUT_URL = BASE_URL + "users/logout";
  static final UPDATE_PROFILE = BASE_URL + "users/profile";
  static final UPDATE_LINKDIN_URL = BASE_URL + "users/profile/linkedin";
  static final UPLOAD_PROFILE = BASE_URL + "users/profileUpload";
  static final HANDLE_NOTIFICATION = BASE_URL + "users/handleNotification";
  static final DETAILS = BASE_URL + "users/details";
  static final USER_VERIFICATION_URL = BASE_URL + "users/verification";
  static final USER_RESET_PASSWORD = BASE_URL + "users/resetPassword";
  static final USER_ACTIVE_DEACTIVE = BASE_URL + "users/activeDeactiveUser";
  static final GET_USER_PROFILE_URL = BASE_URL + "users/getUserProfile";
  static final GET_USER_PROFILE_PERENT_URL = BASE_URL + "users/profilePercent";
  static final GET_USER_PROFILE_BY_ID = BASE_URL + "users/getProfile/";
  static final TERM_CONDITION_URL = BASE_URL + "siteInfo";
  static final GET_POSTS_URL = BASE_URL + "posts/recent";
  static final GET_RECOMMENDATIONS_URL = BASE_URL + "getRecommendedConnections";
  static final Get_Prefrences_url = BASE_URL + "users/verification/otherdetails";
  static final Get_Collage_url = BASE_URL + "users/schools";
  static final Get_School_url = BASE_URL + "users/schoolsProgram";
  static final Profile_Upload_URL = BASE_URL + "users/profileUpload";
  static final POST_SET_PREFRENCES_URL = BASE_URL + "users/saveConnectionPreferences";
  static final UPDATE_PROFILE_DETAILS = BASE_URL + "users/profile/profileDetails";
  static final UPDATE_CONTACT_INFO_URL = BASE_URL + "users/profile/contactInfo";
  static final UPDATE_JOBS_URL = BASE_URL + "users/profile/job";
  static final UPDATE_NETWORK_URL = BASE_URL + "users/profile/networking";
  static final GET_NOTIFICATION_URL = BASE_URL + "users/notifications";
  static final UPDATE_NOTIFICATION_URL = BASE_URL + "users/notifications";
  static final GET_MANAGE_CONTACT_URL = BASE_URL + "users/contact";
  static final GET_SKILL_URL = BASE_URL + "users/skills";
  static final PROFILE_PERCENTAHE_URL = BASE_URL + "users/profilePercent";
  static final GET_PROGRAM_URL = BASE_URL + "users/degreeProgram";


  /* Set up your Educational Details
  Set up your Organizational Details
  Set up your Networking Details
  /v1/users/details/:type {education, networking, organtization}
*/
  Future<SignupResponse> registerAPI(bool isPhone, String email,
      String fullName, String referalCode, String linkedInUrl, String password, String school,
      String college,List interests){
    Map<String, dynamic> requestBody = {
      "isPhone":isPhone,
      "email":email.toString(),
      "fullname":fullName.toString(),
      "school":school.toString(),
      "college":college.toString(),
      "linkedInUrl":linkedInUrl,
      "interests":interests,
      "password":password.toString()};
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(REGISTER_URL, body: jsonBody,headers: headers).then((dynamic res) {
      return SignupResponse.fromJson(res);
    });
  }

 Future<LoginResponse> login(String email, String password) {
   Map<String, dynamic> requestBody = {
   "email": email.toString(),
   "password": password.toString(),
     "isPhone": false
   };
   String jsonBody=json.encode(requestBody);
   // Set the headers
   Map<String, String> headers = {
     'Content-Type': 'application/json',
   };
    return _netUtil.postApi(LOGIN_URL, body: jsonBody,headers: headers).then((dynamic res) {
      return LoginResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> forgotPassword(String email){
    Map<String, dynamic> requestBody = {
      "email":email,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(User_FORGOT_PASSWORD, body:jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<GetCollageResponse> getCollage(){
    Map<String, dynamic> requestBody = {
      "page":"1",
      "limit":"100"
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(Get_Collage_url, body:jsonBody,headers: headers).then((dynamic res) {
      return GetCollageResponse.fromJson(res);
    });
  }
  Future<GetSchoolResponse> getSchool(String id){
    Map<String, dynamic> requestBody = {
      "id":id,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(Get_School_url, body:jsonBody,headers: headers).then((dynamic res) {
      return GetSchoolResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> userExits(String email){
    Map<String, dynamic> requestBody = {
      "email":email,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(USER_EXITS_URL, body:jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> deleteUser(){
    Map<String, dynamic> requestBody = {
      "email":SessionManager.getString(Preferences.EMAIL),
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.deleteApiWithHeaderBearear(DELETE_USER, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> activeDeactiveUser(bool isActive) async {
    Map<String, dynamic> requestBody = {
      "email":SessionManager.getString(Preferences.EMAIL),
      "isActive": isActive
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postWithHeaderBearer(USER_ACTIVE_DEACTIVE, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }

  Future<GetInterestResponse> getUserInterest(String limit,String page) {
    return _netUtil.postApi(USER_INTEREST,body: {
      "limit":limit,
      "page":page,
    }).then((dynamic res) {
      return GetInterestResponse.fromJson(res);
    });
  }

  Future<GetProfileResponse> getProfileById(String userId) {
    return _netUtil.get(GET_USER_PROFILE_BY_ID+userId,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetProfileResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> logout() {
    return _netUtil.getBearer(LOGOUT_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<GetProgramResponse> getProgram() {
    return _netUtil.getBearer(GET_PROGRAM_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetProgramResponse.fromJson(res);
    });
  }
  Future<GetProfilePercentage> getProfilePercentage() {
    return _netUtil.getBearer(PROFILE_PERCENTAHE_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetProfilePercentage.fromJson(res);
    });
  }
  Future<GetSkillsResponse> getSkills() {
    return _netUtil.getBearer(GET_SKILL_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetSkillsResponse.fromJson(res);
    });
  }
  Future<GetNotificationResponse> getNotification() {
    return _netUtil.getBearer(GET_NOTIFICATION_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetNotificationResponse.fromJson(res);
    });
  }
  Future<GetProfileResponse> getUserProfile() {
    return _netUtil.getBearer(GET_USER_PROFILE_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetProfileResponse.fromJson(res);
    });
  }

  Future<GetManageContactResponse> getManageContact() {
    return _netUtil.getBearer(GET_MANAGE_CONTACT_URL,
      {
        "Authorization": SessionManager.getString(Preferences.ACCESS_TOKEN),
      },
    ).then((dynamic res) {
      return GetManageContactResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> updateProfile(String isPhone, String email,
      String fullName,String location,String linkedInUrl,String otherSchool,
      String school,
      String otherSubSchool,
      String departmentName,
      String degreeProgram,
      String userLevel,
      String userIndustry,
      String userJobRoles,
      String graduationTime,
      String careerpathOnly,
      String companyName,
      String currentStatus,
      String lookingFor,
      String helpOthers,
      List secondaryUserIndustry,
      List secondaryUserJobroles,
      String countryCode,
      String phone,
      String status,
      ) async {
    Map<String, dynamic> requestBody = {
      "fullname": fullName,
      "location": location,
      "linkedInUrl": linkedInUrl,
      "otherSchool": otherSchool,
      "school": school,
      "otherSubSchool": otherSubSchool,
      "departmentName": departmentName,
      "degreeProgram": degreeProgram,
      "user_level": userLevel,
      "user_industry": userIndustry,
      "user_jobroles": userJobRoles,
      "graduationTime": graduationTime,
      "careerpathOnly": careerpathOnly,
      "companyName": companyName,
      "currentStatus": currentStatus,
      "lookingFor": lookingFor,
      "helpOthers": helpOthers,
      "secondary_user_industry":secondaryUserIndustry,
      "secondary_user_jobroles":secondaryUserJobroles,
      "countryCode": countryCode,
      "phone": phone,
      "status": status
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postApi(UPDATE_PROFILE, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }


  Future<SuccessResponse> uploadProfilePic(String base64, String fileType, String extension) {
    return _netUtil.postApi(UPLOAD_PROFILE, body: {
      "base64":base64,
      "fileType":fileType,
      "extension":extension
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> editLinkdein(String url) {
    return _netUtil.putApiWithHeaderBearer(UPDATE_LINKDIN_URL, body: {
      "linkedInUrl":url,
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> updateJobs(String jobTitle,companyName,jobLevel,industry,jobFunction) {
    return _netUtil.putApiWithHeaderBearer(UPDATE_JOBS_URL, body: {
      "jobTitle":jobTitle,
      "companyName":companyName,
      "jobLevel":jobLevel,
      "industry":industry,
      "jobFunction":jobFunction,
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> updateNetwork(String lookingFor,helpOther,List additionalExperience,List additionalSkills,) {
    print(additionalExperience);
    print(additionalSkills);
    return _netUtil.postWithHeaders(UPDATE_NETWORK_URL, body: {
      "lookingFor":lookingFor,
      "helpOther":helpOther,
      "additionalExperience":additionalExperience,
      "additionalSkills":additionalSkills,
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> updateContactInfo(String phone,email,city,state) {
    return _netUtil.putApiWithHeaderBearer(UPDATE_CONTACT_INFO_URL, body: {
      "phone":phone,
      "email":email,
      "city":city,
      "state":state,
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> updateNotification(bool pauseAll,groups,connection,comments,message,events) {
    Map<String, dynamic> requestBody = {
      "pauseAll":pauseAll,
      "groups":groups,
      "comments":comments,
      "post":connection,
      "message":message,
      "events":events,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    return _netUtil.postWithHeaderBearer( UPDATE_NOTIFICATION_URL, body:jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> postSetPrefrences(
      String briefBio,List school_list,location,industry,jobroles,ent_pre
      ){
    Map<String, dynamic> requestBody = {
      "brief_bio":SessionManager.getString(Preferences.EMAIL),
      "school_list":school_list,
      "location":location,
      "industry":industry,
      "jobroles":jobroles,
      "ent_pre":ent_pre,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return _netUtil.postWithHeaderBearer(POST_SET_PREFRENCES_URL, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> editProfile(String name,String description) {
    return _netUtil.putApiWithHeaderBearer(UPDATE_PROFILE_DETAILS, body: {
      "fullname":name,
      "description":description,
      "email":SessionManager.getString(Preferences.EMAIL),
    }).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<TermConditionResponse> termsCondition() {
    return _netUtil.postApi(TERM_CONDITION_URL, body: {
      "metaKey":"terms-and-conditions",
    }).then((dynamic res) {
      return TermConditionResponse.fromJson(res);
    });
  }
  Future<TermConditionResponse> aboutUs() {
    return _netUtil.postApi(TERM_CONDITION_URL, body: {
      "metaKey":"about-us",
    }).then((dynamic res) {
      return TermConditionResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> handleNotification(String isUser, String userId, String muteId,bool isMute) {
    Map<String, dynamic> requestBody = {
      "isUser": isUser,
      "userId": userId,
      "muteId": muteId,
      "isMute":isMute
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {'Content-Type': 'application/json',};
    return _netUtil.postWithHeader(HANDLE_NOTIFICATION, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> changePassword(String oldPassword, String newPassword, String confirmPassword,) {
    Map<String, dynamic> requestBody = {
      "email": SessionManager.getString(Preferences.EMAIL),
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
      "oldPassword":oldPassword
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',};
    return _netUtil.postWithHeaderBearer(USER_RESET_PASSWORD, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<GetSetPrefrencess> getSetPrefrencesPrefrences() {
    Map<String, dynamic> requestBody = {
      "limit": 100,
      "page": 1,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',};
    return _netUtil.postWithHeaderBearer(Get_Prefrences_url, body: jsonBody,headers: headers).then((dynamic res) {
      return GetSetPrefrencess.fromJson(res);
    });
  }
  Future<SuccessResponse> getPosts(String limit, String page,) {
    Map<String, dynamic> requestBody = {
      "limit": limit,
      "page": page,
    };
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',};
    return _netUtil.postWithHeaderBearer(GET_POSTS_URL, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }
  Future<SuccessResponse> otherDetailVerification(
      String collageName,
      String schoolName,
      String graduationYear,
      String program,

      String jobTitle,
      String companyName,
      String jobLevel,
      String industry,
      String jobFunction,

      String lookingFor,
      String helpOther,
      List<String> additionalExperience,
      List<String> additionalSkills,

      int type,
      ) {
    // 1 education
    // 2 organization
    // 3 education or organization
    // 4 network
    // 5 education or network
    // 6 organization or network
    // 7 All


    Map<String, dynamic> requestBody = type==1?{
      "educationDetails": {
        "collegeName":collageName,
        "schoolName":schoolName,
        "graduationYear":graduationYear,
        "program":program,
      },
    }:type==2? {
       "organizationDetails": {
        "jobTitle": jobTitle,
        "companyName": companyName,
        "jobLevel": jobLevel,
        "industry": industry,
        "jobFunction": jobFunction,
      }
    }:type==3?{
      "educationDetails": {
        "collegeName":collageName,
        "schoolName":schoolName,
        "graduationYear":graduationYear,
        "program":program,
      },
      "organizationDetails": {
        "jobTitle": jobTitle,
        "companyName": companyName,
        "jobLevel": jobLevel,
        "industry": industry,
        "jobFunction": jobFunction,
      },

    }:type==4?{
      "networkingDetails": {
        "lookingFor":lookingFor,
        "helpOther":helpOther,
        "additionalExperience":additionalExperience,
        "additionalSkills":additionalSkills,
      },
    }:type==5?{
      "educationDetails": {
        "collegeName":collageName,
        "schoolName":schoolName,
        "graduationYear":graduationYear,
        "program":program,
      },
      "networkingDetails": {
        "lookingFor":lookingFor,
        "helpOther":helpOther,
        "additionalExperience":additionalExperience,
        "additionalSkills":additionalSkills,
      },
    }:type==6?{
      "organizationDetails": {
        "jobTitle": jobTitle,
        "companyName": companyName,
        "jobLevel": jobLevel,
        "industry": industry,
        "jobFunction": jobFunction,
      },
      "networkingDetails": {
        "lookingFor":lookingFor,
        "helpOther":helpOther,
        "additionalExperience":additionalExperience,
        "additionalSkills":additionalSkills,
      },
    }:type==7?{
      "educationDetails": {
        "collegeName":collageName,
        "schoolName":schoolName,
        "graduationYear":graduationYear,
        "program":program,
      },
      "organizationDetails": {
        "jobTitle": jobTitle,
        "companyName": companyName,
        "jobLevel": jobLevel,
        "industry": industry,
        "jobFunction": jobFunction,
      },
      "networkingDetails": {
        "lookingFor":lookingFor,
        "helpOther":helpOther,
        "additionalExperience":additionalExperience,
        "additionalSkills":additionalSkills,
      },
    }:{};
    String jsonBody=json.encode(requestBody);
    // Set the headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',};
    return _netUtil.postWithHeaderBearer(USER_VERIFICATION_URL, body: jsonBody,headers: headers).then((dynamic res) {
      return SuccessResponse.fromJson(res);
    });
  }


  Future<ProfileUploadResponse> editProfilePhoto(String imageName) {
    print(imageName+"=");
    return _netUtil.postWithHeaderBearer(Profile_Upload_URL, body: {
      "base64":imageName+"=",
      "fileType":"image",
      "extension":"png",
    }).then((dynamic res) {
      return ProfileUploadResponse.fromJson(res);
    });
  }
}
