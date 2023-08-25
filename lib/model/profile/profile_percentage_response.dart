class GetProfilePercentage {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetProfilePercentage({this.status, this.error, this.message, this.data});

  GetProfilePercentage.fromJson(Map<String, dynamic> json) {
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
  int? profilePercentage;

  Data({this.profilePercentage});

  Data.fromJson(Map<String, dynamic> json) {
    profilePercentage = json['profilePercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profilePercentage'] = this.profilePercentage;
    return data;
  }
}
