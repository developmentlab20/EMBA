class GetSkillsResponse {
  int? status;
  bool? error;
  String? message;
  List<GetSkills>? data;

  GetSkillsResponse({this.status, this.error, this.message, this.data});

  GetSkillsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetSkills>[];
      json['data'].forEach((v) {
        data!.add(new GetSkills.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetSkills {
  String? sId;
  String? tagname;
  int? categoryid;
  String? createdAt;
  String? updatedAt;
  String? description;
  int? tagid;
  bool? isdisabled;
  bool? isdeleted;

  GetSkills(
      {this.sId,
        this.tagname,
        this.categoryid,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.tagid,
        this.isdisabled,
        this.isdeleted});

  GetSkills.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    tagname = json['tagname'];
    categoryid = json['categoryid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    description = json['description'];
    tagid = json['tagid'];
    isdisabled = json['isdisabled'];
    isdeleted = json['isdeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['tagname'] = this.tagname;
    data['categoryid'] = this.categoryid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['description'] = this.description;
    data['tagid'] = this.tagid;
    data['isdisabled'] = this.isdisabled;
    data['isdeleted'] = this.isdeleted;
    return data;
  }
}
