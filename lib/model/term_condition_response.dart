class TermConditionResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;

  TermConditionResponse({this.status, this.error, this.message, this.data});

  TermConditionResponse.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? metaKey;
  String? metaValue;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId, this.metaKey, this.metaValue, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    metaKey = json['metaKey'];
    metaValue = json['metaValue'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['metaKey'] = this.metaKey;
    data['metaValue'] = this.metaValue;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
