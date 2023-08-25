class PickupYourInterstModel{
  String text;
  bool value;
  String? id;
  PickupYourInterstModel({required this.text,required this.value,required this.id});
}
class InterstModel{
  String text;
  bool value;
  InterstModel({required this.text,required this.value,});
}
class GroupModel {
  bool? online;
  String? name;
  String? image;
  bool? groupLeader;
  bool? newPosts;
  bool? request;
  bool? join;

  GroupModel({
    required this.online,
    required this.name,
    required this.image,
    required this.groupLeader,
    required this.newPosts,
    required this.request,
    required this.join,
  });
}

class ImageText{
  String text;
  String image;
  ImageText({required this.text,required this.image});
}
class NetworkModel {
  String name;
  String imageUrl;
  NetworkModel({required this.name, required this.imageUrl});
}
class ImgBoolText{
  String text;
  String imageUrl;
  bool value;
  ImgBoolText({required this.text,required this.imageUrl,required this.value});
}
class AddToList{
  String title;
  String subTitle;
  String image;
  bool value;
  AddToList({required this.title,required this.subTitle,required this.image,required this.value});
}
class EducationModel{
  String graduationYear;
  String schoolName;
  String program;
  String collegeName;

  EducationModel({required this.graduationYear,required this.schoolName,required this.program,required this.collegeName});
}
class OrganizationDetailsModel{
  String jobTitle;
  String companyName;
  String jobLevel;
  String industry;
  String jobFunction;
  OrganizationDetailsModel({required this.jobTitle,required this.companyName,required this.jobLevel,required this.industry,
    required this.jobFunction});
}
class NetworkingDetailsModel{
  String lookingFor;
  String helpOther;
  String additionalExperience;
  String additionalSkills;
  NetworkingDetailsModel({required this.lookingFor,required this.helpOther,required this.additionalExperience,
    required this.additionalSkills});
}
class CollageList{
  String id;
  String collageName;
  CollageList({required this.collageName,required this.id});
}