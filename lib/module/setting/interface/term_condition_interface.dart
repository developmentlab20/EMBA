import '../../../model/sucess_response.dart';
import '../../../model/term_condition_response.dart';
import '../../../utils/rest_ds.dart';

abstract class TermConditionInterface {
  onSuccessRespnse(TermConditionResponse response);
  onError(String msg,int status);
}
class TermConditionPresenter{
  TermConditionInterface _view;
  RestDatasource api = new RestDatasource();
  TermConditionPresenter(this._view);

  doTermCondition(){
    api.termsCondition().then((TermConditionResponse response){
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
  doAboutUS(){
    api.aboutUs().then((TermConditionResponse response){
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
}