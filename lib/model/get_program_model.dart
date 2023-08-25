class GetProgramResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetProgramResponse({this.status, this.error, this.message, this.data});

  GetProgramResponse.fromJson(Map<String, dynamic> json) {
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
  List<DegreeProgram>? degreeProgram;

  Data({this.degreeProgram});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['degreeProgram'] != null) {
      degreeProgram = <DegreeProgram>[];
      json['degreeProgram'].forEach((v) {
        degreeProgram!.add(new DegreeProgram.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.degreeProgram != null) {
      data['degreeProgram'] =
          this.degreeProgram!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DegreeProgram {
  String? sId;
  String? name;

  DegreeProgram({this.sId, this.name});

  DegreeProgram.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
