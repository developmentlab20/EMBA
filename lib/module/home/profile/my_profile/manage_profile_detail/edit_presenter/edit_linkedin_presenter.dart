import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/model/sucess_response.dart';

import '../../../../../../utils/rest_ds.dart';


abstract class EditLinkedinInterface {
  onSuccessResponse(SuccessResponse response);
  onProfileUploadResponse(ProfileUploadResponse response);
  onError(String msg,int status);
}

class EditProfilePresenter {
  EditLinkedinInterface _view;
  RestDatasource api = new RestDatasource();
  EditProfilePresenter(this._view);
  doEditLinkdin(String url) {
    api.editLinkdein(url)
        .then((SuccessResponse response) {
      if (response.status == 200) {
        _view.onSuccessResponse(response);
      }else if(response.status==400){
        _view.onError(response.message.toString(),response.status!);
      }else if(response.status==500){
        _view.onError(response.message.toString(),response.status!);
      }
      else {
        _view.onError(response.message.toString(),response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doEditProfile(String name,String description) {
    api.editProfile(name,description)
        .then((SuccessResponse response) {
      if (response.status == 200) {
        _view.onSuccessResponse(response);
      }else if(response.status==400){
        _view.onError(response.message.toString(),response.status!);
      }else if(response.status==500){
        _view.onError(response.message.toString(),response.status!);
      }
      else {
        _view.onError(response.message.toString(),response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }

  doEditProfilePhoto(String imageName) {
    api.editProfilePhoto(imageName)
        .then((ProfileUploadResponse response) {
      if (response.status == 200) {
        _view.onProfileUploadResponse(response);
      }else if(response.status==400){
        _view.onError(response.message.toString(),response.status!);
      }else if(response.status==500){
        _view.onError(response.message.toString(),response.status!);
      }
      else {
        _view.onError(response.message.toString(),response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
}
