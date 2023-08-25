class GetNotificationResponse {
  int? status;
  bool? error;
  String? message;
  Data? data;

  GetNotificationResponse({this.status, this.error, this.message, this.data});

  GetNotificationResponse.fromJson(Map<String, dynamic> json) {
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
  bool? comments;
  bool? events;
  bool? groups;
  bool? message;
  bool? pauseAll;
  bool? post;

  Data(
      {this.comments,
        this.events,
        this.groups,
        this.message,
        this.pauseAll,
        this.post});

  Data.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    events = json['events'];
    groups = json['groups'];
    message = json['message'];
    pauseAll = json['pauseAll'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['events'] = this.events;
    data['groups'] = this.groups;
    data['message'] = this.message;
    data['pauseAll'] = this.pauseAll;
    data['post'] = this.post;
    return data;
  }
}
