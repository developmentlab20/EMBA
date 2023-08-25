import '../../../model/notification/get_notification_response.dart';
import '../../../model/sucess_response.dart';
import '../../../model/term_condition_response.dart';
import '../../../utils/rest_ds.dart';

abstract class GetNotificationInterface {
  onSuccessRespnse(GetNotificationResponse response);
  onSuccessUpdateRespnse(SuccessResponse response);
  onError(String msg,int status);
}
class GetNotificationPresenter{
  GetNotificationInterface _view;
  RestDatasource api = new RestDatasource();
  GetNotificationPresenter(this._view);

  doGetNotification(){
    api.getNotification().then((GetNotificationResponse response){
      if (response.status==200){
        _view.onSuccessRespnse(response);
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
  doUpdateNotification(bool pauseAll,groups,connection,post,message,events){
    api.updateNotification(pauseAll, groups, connection, post, message, events
    ).then((SuccessResponse response){
      if (response.status==200){
        _view.onSuccessUpdateRespnse(response);
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