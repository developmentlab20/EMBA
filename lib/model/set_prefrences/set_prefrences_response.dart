class GetSetPrefrencess {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetSetPrefrencess({this.status, this.error, this.message, this.data});

  GetSetPrefrencess.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<String>? schoolsModel;
  List<String>? levels;
  List<String>? jobFunctions;
  List<String>? industries;

  Data({this.schoolsModel, this.levels, this.jobFunctions, this.industries});

  Data.fromJson(Map<String, dynamic> json) {
    schoolsModel = json['schoolsModel'].cast<String>();
    levels = json['levels'].cast<String>();
    jobFunctions = json['jobFunctions'].cast<String>();
    industries = json['industries'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schoolsModel'] = this.schoolsModel;
    data['levels'] = this.levels;
    data['jobFunctions'] = this.jobFunctions;
    data['industries'] = this.industries;
    return data;
  }
}
