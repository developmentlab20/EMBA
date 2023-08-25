import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/model/sucess_response.dart';

import '../../../../../../utils/rest_ds.dart';


abstract class EditManageContactInterface {
  onSuccessResponse(SuccessResponse response);
  onError(String msg,int status);
}

class EditManageContactPresenter {
  EditManageContactInterface _view;
  RestDatasource api = new RestDatasource();
  EditManageContactPresenter(this._view);
  doEditProfile(String phone,email,city,state) {
    api.updateContactInfo(phone,email,city,state)
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
}
