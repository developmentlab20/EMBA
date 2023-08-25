class GetSchoolResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetSchoolResponse({this.status, this.error, this.message, this.data});

  GetSchoolResponse.fromJson(Map<String, dynamic> json) {
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
  List<SchoolsModel>? schoolsModel;

  Data({this.schoolsModel});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['schoolsModel'] != null) {
      schoolsModel = <SchoolsModel>[];
      json['schoolsModel'].forEach((v) {
        schoolsModel!.add(new SchoolsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schoolsModel != null) {
      data['schoolsModel'] = this.schoolsModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SchoolsModel {
  String? sId;
  String? name;
  String? domain;
  List<String>? programs;

  SchoolsModel({this.sId, this.name, this.domain, this.programs});

  SchoolsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    domain = json['domain'];
    programs = json['programs'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['domain'] = this.domain;
    data['programs'] = this.programs;
    return data;
  }
}
