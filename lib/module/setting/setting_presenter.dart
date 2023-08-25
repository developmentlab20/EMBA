import 'package:emba/model/sucess_response.dart';

import '../../model/login_response.dart';
import '../../utils/rest_ds.dart';

abstract class SettingInterface {
  onSuccessRespnse(SuccessResponse response);
  onSuccessNotificationRespnse(SuccessResponse response);
  onSuccessActiveRespnse(SuccessResponse response);
  onError(String msg,int status);
}

class SettingPresenter {
  SettingInterface _view;
  RestDatasource api = new RestDatasource();
  SettingPresenter(this._view);

  doDelete() {
    api.deleteUser()
        .then((SuccessResponse user) {
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

  doActiveDeactive(bool isActive) {
    api.activeDeactiveUser(isActive)
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessActiveRespnse(user);
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
 doNotification(String isUser, String userId, String muteId,bool isMute) {
    api.handleNotification(isUser,userId,muteId,isMute)
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessActiveRespnse(user);
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
