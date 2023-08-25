class ProfileUploadResponse {
  int? status;
  bool? error;
  String? message;
  String? displayPicName;

  ProfileUploadResponse(
      {this.status, this.error, this.message, this.displayPicName});

  ProfileUploadResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    error = json['error'];
    message = json['message'];
    displayPicName = json['displayPicName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['error'] = this.error;
    data['message'] = this.message;
    data['displayPicName'] = this.displayPicName;
    return data;
  }
}
