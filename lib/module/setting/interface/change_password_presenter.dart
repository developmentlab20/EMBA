import '../../../model/sucess_response.dart';
import '../../../utils/rest_ds.dart';

abstract class ChangePassswordInterface {
  onSuccessRespnse(SuccessResponse response);
  onError(String msg,int status);
}
class ChangePassswordPresenter {
  ChangePassswordInterface _view;
  RestDatasource api = new RestDatasource();
  ChangePassswordPresenter(this._view);

  doChangePassword(String oldPassword, String newPassword, String confirmPassword,) {
    api.changePassword(oldPassword,newPassword,confirmPassword)
        .then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
      }
      else if (user.status == 400) {
        _view.onError(user.message!,user.status!);
      }  else if (user.status == 500) {
        _view.onError(user.message!,user.status!);      }
      else if (user.status == 203) {
        _view.onError(user.message!,user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),600));

  }
}