import 'package:emba/model/sucess_response.dart';

import '../../model/login_response.dart';
import '../../utils/rest_ds.dart';

abstract class LoginInterface {
  onSuccessRespnse(LoginResponse response);
  onSuccessForgotRespnse(SuccessResponse response);
  onError(String msg,int status);
}

class LoginPresenter {
  LoginInterface _view;
  RestDatasource api = new RestDatasource();
  LoginPresenter(this._view);

  doLogin(String email, String password) {
    api.login(email,password)
        .then((LoginResponse user) {
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

  doForgotPassword(String email,) {
    api.forgotPassword(email)
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessForgotRespnse(user);
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
    }).catchError((Object error) => _view.onError(error.toString(),500));

  }
}
