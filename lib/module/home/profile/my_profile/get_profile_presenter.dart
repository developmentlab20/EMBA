import 'package:emba/model/sucess_response.dart';
import '../../../../model/profile/get_profile_response.dart';
import '../../../../utils/rest_ds.dart';
abstract class SettingInterface {
  onSuccessRespnse(GetProfileResponse response);
  onError(String msg,int status);
}

class SettingPresenter {
  SettingInterface _view;
  RestDatasource api = new RestDatasource();
  SettingPresenter(this._view);
  doGetProfile() {
    api.getUserProfile()
        .then((GetProfileResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
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
