import 'package:emba/model/sucess_response.dart';

import '../../../model/login_response.dart';
import '../../../utils/rest_ds.dart';

abstract class LogoutInterface {
  onSuccessRespnse(SuccessResponse response);
  onError(String msg,int status);
}

class LogoutPresenter {
  LogoutInterface _view;
  RestDatasource api = new RestDatasource();
  LogoutPresenter(this._view);

  doLogout() {
    api.logout().then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
      }
      else if (user.status == 400) {
        _view.onError(user.message!,user.status!);
      }  else if (user.status == 403) {
        _view.onSuccessRespnse(user);      }
      else if (user.status == 203) {
        _view.onError(user.message!,user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),600));

  }
}
