class SuccessResponse {
  int? status;
  bool? error;
  String? message;

  SuccessResponse({this.status, this.error, this.message});

  SuccessResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
