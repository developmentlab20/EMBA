import 'package:emba/model/profile/profile_upload_response.dart';
import 'package:emba/model/sucess_response.dart';
import '../../../../../../model/profile/get_manage_contact_response.dart';
import '../../../../../../utils/rest_ds.dart';


abstract class GetManageContactInterface {
  onSuccessResponse(GetManageContactResponse response);
  onError(String msg,int status);
}

class GetManageContactPresenter {
  GetManageContactInterface _view;
  RestDatasource api = new RestDatasource();
  GetManageContactPresenter(this._view);
  doGetManageContact() {
    api.getManageContact()
        .then((GetManageContactResponse response) {
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
