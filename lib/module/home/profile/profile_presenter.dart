
import 'package:emba/model/sucess_response.dart';

import '../../../model/profile/get_profile_response.dart';
import '../../../model/profile/profile_percentage_response.dart';
import '../../../utils/rest_ds.dart';


abstract class ProfileInterface {
  onProfileRespnse(GetProfileResponse response);
  onUpdateProfile(SuccessResponse response);
  onUploadProfile(SuccessResponse response);
  onProfilePercentage(GetProfilePercentage response);
  onError(String msg,int status);
}

class ProfilePresenter {
  ProfileInterface _view;
  RestDatasource api = new RestDatasource();
  ProfilePresenter(this._view);
  doProfilePercentage(){
    api.getProfilePercentage().then((GetProfilePercentage res){
      if(res.status==200){
        _view.onProfilePercentage(res);
      }else{
        _view.onError(res.message.toString(), res.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doUpdateProfile(String isPhone, String email,
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
      String status,) {
    api.updateProfile( isPhone,  email,
       fullName, location, linkedInUrl, otherSchool,
       school,
       otherSubSchool,
       departmentName,
       degreeProgram,
       userLevel,
       userIndustry,
       userJobRoles,
       graduationTime,
       careerpathOnly,
       companyName,
       currentStatus,
       lookingFor,
       helpOthers,
       secondaryUserIndustry,
       secondaryUserJobroles,
       countryCode,
       phone,
       status,)
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onUpdateProfile(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));

  }
  doUploadProfile(String base64, String fileType, String extension) {
    api.uploadProfilePic( base64,  fileType,
      extension, )
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onUploadProfile(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));

  }
  doGetProfileByUserId(String userId) {
    api.getProfileById( userId )
        .then((GetProfileResponse user) {
      if (user.status == 200) {
        _view.onProfileRespnse(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetProfile() {
    api.getUserProfile()
        .then((GetProfileResponse user) {
      if (user.status == 200) {
        _view.onProfileRespnse(user);
      }
      else if (user.status == 400) {
        _view.onError(user.message!,user.status!);
      }  else if (user.status == 500) {
        _view.onError(user.message!,user.status!);
      }
      else if (user.status == 203) {
        _view.onError(user.message!,user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),600));

  }
}
