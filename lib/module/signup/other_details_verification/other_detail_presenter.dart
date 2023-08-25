import 'package:emba/model/sucess_response.dart';
import '../../../model/get_collage_response.dart';
import '../../../model/get_program_model.dart';
import '../../../model/get_school_response.dart';
import '../../../model/get_skills_response.dart';
import '../../../model/set_prefrences/set_prefrences_response.dart';
import '../../../utils/rest_ds.dart';

abstract class OtherDetailVerificationInterface {
  onSuccessRespnse(SuccessResponse response);
  onSuccessGetCollage(GetCollageResponse response);
  onSuccessGetSchool(GetSchoolResponse response);
  onSucessGetPrefrences(GetSetPrefrencess response);
  onSucessGetSkills(GetSkillsResponse response);
  onSucessGetProgram(GetProgramResponse response);

  onError(String msg,int status);
}

class OtherDetailVerificationPresenter {
  OtherDetailVerificationInterface _view;
  RestDatasource api = new RestDatasource();
  OtherDetailVerificationPresenter(this._view);

  doEditJob(String jobTitle,companyName,jobLevel,industry,jobFunction){
    api.updateJobs(jobTitle, companyName, jobLevel, industry, jobFunction).then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetProgram(){
    api.getProgram().then((GetProgramResponse user) {
      if (user.status == 200) {
        _view.onSucessGetProgram(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doEditNetwork(String lookingFor,helpOther,List additionalExperience,List additionalSkills,){
    print(additionalExperience);
    api.updateNetwork(lookingFor, helpOther, additionalExperience, additionalSkills,).then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetSkills(){
  api.getSkills().then((GetSkillsResponse res) {
    if(res.status==200){
      _view.onSucessGetSkills(res);
    }else{
      _view.onError(res.message.toString(), res.status!);
    }
  }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doVerification(
      String collageName,
      String schoolName,
      String graduationYear,
      String program,

      String jobTitle,
      String companyName,
      String jobLevel,
      String industry,
      String jobFunction,

      String lookingFor,
      String helpOther,
      List<String> additionalExperience,
      List<String> additionalSkills,

      int type,
      ) {
    api.otherDetailVerification(
        collageName,
      schoolName,
      graduationYear,
      program,

      jobTitle,
      companyName,
      jobLevel,
      industry,
      jobFunction,
      lookingFor,
      helpOther,
      additionalExperience,
      additionalSkills,
        type
    ).then((SuccessResponse user) {
      if (user.status == 200) {
        _view.onSuccessRespnse(user);
      }else if(user.status==400){
        _view.onError(user.message.toString(),user.status!);
      }else if(user.status==500){
        _view.onError(user.message.toString(),user.status!);
      }
      else {
        _view.onError(user.message.toString(),user.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetCollage(){
    api.getCollage().then((GetCollageResponse response){
      if(response.status==200){
        _view.onSuccessGetCollage(response);
      }else{
        _view.onError(response.message.toString(), response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
  doGetSchool(String id){
    api.getSchool(id).then((GetSchoolResponse response){
      if(response.status==200){
        _view.onSuccessGetSchool(response);
      }else{
        _view.onError(response.message.toString(), response.status!);
      }
    }).catchError((Object error) => _view.onError(error.toString(),500));
  }
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
