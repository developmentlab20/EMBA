import 'package:emba/model/set_prefrences/set_prefrences_response.dart';
import 'package:emba/model/sucess_response.dart';
import 'package:emba/utils/rest_ds.dart';

abstract class PostSetPrefrencesInterface{
  onSucessPostPrefrences(SuccessResponse response);
  onError(String msg,int status);

}
class PostSetPrefrencesPresenter{
  PostSetPrefrencesInterface _view;
  RestDatasource api =RestDatasource();
  PostSetPrefrencesPresenter(this._view);

  doPostSetPrefrences(String briefBio,List school_list,location,industry,jobroles,ent_pre){
    api.postSetPrefrences(briefBio, school_list, location, industry, jobroles, ent_pre).then((SuccessResponse res){
      if(res.status==200){
        _view.onSucessPostPrefrences(res);
      }else{
        _view.onError(res.message.toString(),res.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),600));

  }
}