import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/sharedpref/preferences.dart';
import 'package:emba/utils/sharedpref/shared_prefrence.dart';

import '../../model/get_collage_response.dart';
import '../../model/get_interest_response.dart';
import '../../model/get_school_response.dart';
import '../../model/signup_response.dart';
import '../../utils/rest_ds.dart';

abstract class SignupInterface {
  onSuccessRespnse(SignupResponse response);
  onSuccessInterest(GetInterestResponse response);
  onSuccess(SuccessResponse response);
  onSuccessGetCollage(GetCollageResponse response);
  onSuccessGetSchool(GetSchoolResponse response);
  onError(String msg,int status);
}

class SignupPresenter {
  SignupInterface _view;
  RestDatasource api = new RestDatasource();
  SignupPresenter(this._view);

  doRegister(bool isPhone, String email,
      String fullName, String referalCode, String linkedInUrl, String password, String school,
      String college,List interests) {
    api.registerAPI( isPhone,email,fullName,referalCode,linkedInUrl,password,school,college,interests)
        .then((SignupResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
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
  doGetInterest(String limit,String page) {
    api.getUserInterest(limit,page)
        .then((GetInterestResponse user) {
      if (user.status == 200) {
        _view.onSuccessInterest(user);
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
  doEmailExist(String email){
    api.userExits(email).then((SuccessResponse res){
    if(res.status==200){
      _view.onSuccess(res);
    }else{
      _view.onError(res.message.toString(), res.status!);
    }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetCollage(){
    api.getCollage().then((GetCollageResponse response){
      if(response.status==200){
        _view.onSuccessGetCollage(response);
      }else{
        _view.onError(response.message.toString(), response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetSchool(String id){
    api.getSchool(id).then((GetSchoolResponse response){
      if(response.status==200){
        _view.onSuccessGetSchool(response);
      }else{
        _view.onError(response.message.toString(), response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doEditDes(){
    api.editProfile(SessionManager.getString(Preferences.USER_NAME),"");
  }
}
