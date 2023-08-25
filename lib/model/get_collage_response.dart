class GetCollageResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetCollageResponse({this.status, this.error, this.message, this.data});

  GetCollageResponse.fromJson(Map<String, dynamic> json) {
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
  int? totalSchoolsModel;
  int? totalPages;
  String? currentPage;

  Data(
      {this.schoolsModel,
        this.totalSchoolsModel,
        this.totalPages,
        this.currentPage});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['schoolsModel'] != null) {
      schoolsModel = <SchoolsModel>[];
      json['schoolsModel'].forEach((v) {
        schoolsModel!.add(new SchoolsModel.fromJson(v));
      });
    }
    totalSchoolsModel = json['totalSchoolsModel'];
    totalPages = json['totalPages'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schoolsModel != null) {
      data['schoolsModel'] = this.schoolsModel!.map((v) => v.toJson()).toList();
    }
    data['totalSchoolsModel'] = this.totalSchoolsModel;
    data['totalPages'] = this.totalPages;
    data['currentPage'] = this.currentPage;
    return data;
  }
}

class SchoolsModel {
  String? sId;
  String? name;
  String? domain;
  List<String>? programs;
  bool? newAdded;
  int? iV;
  String? createdAt;
  String? updatedAt;

  SchoolsModel(
      {this.sId,
        this.name,
        this.domain,
        this.programs,
        this.newAdded,
        this.iV,
        this.createdAt,
        this.updatedAt});

  SchoolsModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    domain = json['domain'];
    programs = json['programs'].cast<String>();
    newAdded = json['newAdded'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['domain'] = this.domain;
    data['programs'] = this.programs;
    data['newAdded'] = this.newAdded;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
