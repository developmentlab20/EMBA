import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/utils/rest_ds.dart';

abstract class GetSetPrefrencesInterface{
  onSucessGetPrefrences(GetSetPrefrencess response);
  onError(String msg,int status);

}
class GetSetPrefrencesPresenter{
  GetSetPrefrencesInterface _view;
  RestDatasource api =RestDatasource();
  GetSetPrefrencesPresenter(this._view);

  doGetSetPrefrences(){
    api.getSetPrefrencesPrefrences().then((GetSetPrefrencess res){
      if(res.status==200){
        _view.onSucessGetPrefrences(res);
      }else{
        _view.onError(res.message.toString(),res.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),600));

  }
}