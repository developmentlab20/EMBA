import '../../model/bool_text.dart';
import '../../model/network_model.dart';
import '../string_utils.dart';

class Constants{
  static List <String> collageName =["Collage 1","Collage 2","Collage 3"];
  static List <String> additionalsSkills =[
    "Accounts",
    "Analytics & Intelligence",
    "Business Development",
    "Consulting",
    "Customer Service",
    "Design",
    "Digital",
    "Distribution",
  ];
  static List <ImageText> groupSettings=[
    ImageText(text:UtilStrings.Edit_Group_Details, image:"edit_icon.png"),
    ImageText(text:UtilStrings.Pending_Approvals, image:"person_clock.png"),
    ImageText(text:UtilStrings.Reported_Posts, image:"report_icon.png"),
    ImageText(text:UtilStrings.Change_Privacy, image:"change_privacy.png"),
    ImageText(text:UtilStrings.Delete_Group, image:"delete_group_icon.png"),
  ];
  static List <String> groupDetailCategory =["Category 1","Category 2","Category 3"];
  static List <InterstModel> reportedPosts=[
    InterstModel(text: "Mixpanel", value: false),
    InterstModel(text: "Hotjar", value: false),
    InterstModel(text: "Glassbox", value: false),
    InterstModel(text: "Heap", value: false),
  ];
  static List <GroupModel> groupModel=[
    GroupModel(online: true, name:"Y Combinator Discussion", image: "demo_image.png", groupLeader: true, newPosts: true, request: false, join: false),
    GroupModel(online: true, name:"Compensation", image: "demo_image.png", groupLeader: false, newPosts: true, request: false, join: false),
    GroupModel(online: true, name:"Startup", image: "demo_image.png", groupLeader: true, newPosts: false, request: false, join: false),
    GroupModel(online: false, name:"EMBA Confessions", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: false),
    GroupModel(online: false, name:"Industry Experts", image: "demo_image.png", groupLeader: false, newPosts: false, request: true, join: false),
    GroupModel(online: false, name:"Venture Studio Updates", image: "demo_image.png", groupLeader: false, newPosts: false, request: true, join: false),
    GroupModel(online: false, name:"EMBA MIT", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: true),
    GroupModel(online: false, name:"Job in Tech", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: true),
  ];
  static List <GroupModel> networkRecommended=[
    GroupModel(online: true, name:"Naman Rastogi", image: "demo_image.png", groupLeader: true, newPosts: true, request: false, join: false),
    GroupModel(online: true, name:"Wade Waren", image: "demo_image.png", groupLeader: false, newPosts: true, request: false, join: false),
    GroupModel(online: true, name:"Divon Lane", image: "demo_image.png", groupLeader: true, newPosts: false, request: false, join: false),
    GroupModel(online: false, name:"Robert", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: false),
    GroupModel(online: false, name:"Industry Experts", image: "demo_image.png", groupLeader: false, newPosts: false, request: true, join: false),
    GroupModel(online: false, name:"Venture Studio Updates", image: "demo_image.png", groupLeader: false, newPosts: false, request: true, join: false),
    GroupModel(online: false, name:"EMBA MIT", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: true),
    GroupModel(online: false, name:"Job in Tech", image: "demo_image.png", groupLeader: false, newPosts: false, request: false, join: true),
  ];
  static List <InterstModel> feedJobs=[
    InterstModel(text:UtilStrings.Feed, value: true),
    InterstModel(text:UtilStrings.Jobs, value: false),
    InterstModel(text:UtilStrings.Resources, value: false),
    InterstModel(text:UtilStrings.Poll, value: false),
    InterstModel(text:UtilStrings.My_Activity, value: false),
  ];
  static List <InterstModel> leaderboard=[
    InterstModel(text:UtilStrings.Influencer, value: true),
    InterstModel(text:UtilStrings.Speaker, value: false),
    InterstModel(text:UtilStrings.Creator, value: false),
  ];
  static List <InterstModel> networkList=[
    InterstModel(text:UtilStrings.Requests, value: true),
    InterstModel(text:UtilStrings.My_Connections, value: false),
    InterstModel(text:UtilStrings.Recommended, value: false),
    InterstModel(text:UtilStrings.People_Nearby_Me, value: false),
    InterstModel(text:UtilStrings.My_Lists, value: false),
    InterstModel(text:UtilStrings.Search_People, value: false),
  ];
  static List <InterstModel> eventDetails=[
    InterstModel(text:UtilStrings.Details, value: true),
    InterstModel(text:UtilStrings.Attendees, value: false),
    InterstModel(text:UtilStrings.Discussion, value: false),
    InterstModel(text:UtilStrings.Resources, value: false),
  ];
  static List<InterstModel> interstList=[
    InterstModel(text: UtilStrings.Startup, value: false),
    InterstModel(text: UtilStrings.Industry_Experts, value: false),
    InterstModel(text: UtilStrings.Compensation, value: false),
    InterstModel(text: UtilStrings.Opportunities, value: false),
    InterstModel(text: UtilStrings.Y_Combinator, value: false),
    InterstModel(text: UtilStrings.Layoff, value: false),
    InterstModel(text: UtilStrings.EMBA_Confession, value: false),
    InterstModel(text: UtilStrings.Private_Equity, value: false),
    InterstModel(text: UtilStrings.Fund_Raising, value: false),
    InterstModel(text: UtilStrings.Venture_Capital, value: false),
  ];
  static List <String> homeRecent =["Recent","Popular",];
  static List<String>imageStackList=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ntV_fUhx-LYd7up5Y9pHImae6lrM1WT3VrP0kZsoBLEBQe65ajBuUNUt8BvtVo-G95w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSD0XLEaT5CtjF-wjpktGBOGZ3zcNZuyVVj5osLcVXyra9HytvgxyiLclfJpQDDcZQbaQ&usqp=CAU"
  ];

  static List <bool>like=[false,false];

  static List <InterstModel> selectSchool=[
    InterstModel(text: UtilStrings.UCLA, value: false),
    InterstModel(text: UtilStrings.University_of_Wisconsin_Green_Bay, value: false),
    InterstModel(text: UtilStrings.University_of_California_Berkeley, value: false),
    InterstModel(text: UtilStrings.San_Diego_State_University, value: false),
    InterstModel(text: UtilStrings.Trine_University, value: false),
    InterstModel(text: UtilStrings.California_State_University_Fullerton, value: false),
    InterstModel(text: UtilStrings.Arizona_State_University, value: false),
  ];
  static List <InterstModel> selectLocations=[
    InterstModel(text: UtilStrings.UCLA, value: false),
    InterstModel(text: UtilStrings.University_of_Wisconsin_Green_Bay, value: false),
    InterstModel(text: UtilStrings.University_of_California_Berkeley, value: false),
    InterstModel(text: UtilStrings.San_Diego_State_University, value: false),
    InterstModel(text: UtilStrings.Trine_University, value: false),
    InterstModel(text: UtilStrings.California_State_University_Fullerton, value: false),
    InterstModel(text: UtilStrings.Arizona_State_University, value: false),
  ];
  static List <InterstModel> selectIndustry=[
    InterstModel(text: UtilStrings.UCLA, value: false),
    InterstModel(text: UtilStrings.University_of_Wisconsin_Green_Bay, value: false),
    InterstModel(text: UtilStrings.University_of_California_Berkeley, value: false),
    InterstModel(text: UtilStrings.San_Diego_State_University, value: false),
    InterstModel(text: UtilStrings.Trine_University, value: false),
    InterstModel(text: UtilStrings.California_State_University_Fullerton, value: false),
    InterstModel(text: UtilStrings.Arizona_State_University, value: false),
  ];
  static List <InterstModel> selectFunctions=[
    InterstModel(text: UtilStrings.UCLA, value: false),
    InterstModel(text: UtilStrings.University_of_Wisconsin_Green_Bay, value: false),
    InterstModel(text: UtilStrings.University_of_California_Berkeley, value: false),
    InterstModel(text: UtilStrings.San_Diego_State_University, value: false),
    InterstModel(text: UtilStrings.Trine_University, value: false),
    InterstModel(text: UtilStrings.California_State_University_Fullerton, value: false),
    InterstModel(text: UtilStrings.Arizona_State_University, value: false),
  ];
  static List <InterstModel> selectEntreprenuership=[
    InterstModel(text: UtilStrings.UCLA, value: false),
    InterstModel(text: UtilStrings.University_of_Wisconsin_Green_Bay, value: false),
    InterstModel(text: UtilStrings.University_of_California_Berkeley, value: false),
    InterstModel(text: UtilStrings.San_Diego_State_University, value: false),
    InterstModel(text: UtilStrings.Trine_University, value: false),
    InterstModel(text: UtilStrings.California_State_University_Fullerton, value: false),
    InterstModel(text: UtilStrings.Arizona_State_University, value: false),
  ];
  static List  <ImageText>netwokList=[
    ImageText(text: "Looking for", image: "search.png"),
    ImageText(text: "Interests", image: "interest.png"),
    ImageText(text: "Can help with", image: "help.png"),
    ImageText(text: "Relevant Experience", image: "experience.png"),
    ImageText(text: "Skills", image: "ic_skill.png"),
  ];
  static List<InterstModel> filterBadges=[
    InterstModel(text: "Community leader", value: false),
    InterstModel(text: "Infulancer of the...", value: false),
    InterstModel(text: "Finicial Expert", value: false),
    InterstModel(text: "Speaker of The Month", value: false),
    InterstModel(text: "Funding Expert", value: false),
    InterstModel(text: "Function Expert", value: false),
  ];
  static List <InterstModel> jobList=[
    InterstModel(text:UtilStrings.Recommended, value: true),
    InterstModel(text:UtilStrings.Applied, value: false),
    InterstModel(text:UtilStrings.Saved, value: false),
    InterstModel(text:UtilStrings.My_Posted_Jobs, value: false),
  ];
  static List <String> program=[
    "Bachelors Degree","Masters Degree","Post Doctorate","PHD","EMBA","Sloan Fellows","MD","MBA"
  ];
  static List <InterstModel> industry=[
    InterstModel(text: "Management of Companies and Enterprises", value: false),
    InterstModel(text: "Real Estate and Rental and Leasing", value: false),
    InterstModel(text: "Arts, Entertainment, and Recreation", value: false),
    InterstModel(text: "Manufacturing", value: false),
    InterstModel(text: "Mining, Quarrying, and Oil and Gas Extraction", value: false),
    InterstModel(text: "Resale Trade", value: false),
    InterstModel(text: "Health Care and Social Assistance", value: false),
    InterstModel(text: "Commercial  & Professional Services", value: false),
    InterstModel(text: "Arizona State University", value: false),
    InterstModel(text: "Arizona State University", value: false),
    InterstModel(text: "Arizona State University", value: false),
  ];
  static List <ImgBoolText>searchNearBy=[
    ImgBoolText(text: "Industry", imageUrl: "ic_building.png", value: true),
    ImgBoolText(text: "Job Function", imageUrl: "job_icon.png", value: false),
    ImgBoolText(text: "Job Title", imageUrl: "job_fun_icon.png", value: false),
    ImgBoolText(text: "School", imageUrl: "bank_icon.png", value: false),
  ];
  static List <ImgBoolText>influencerList=[
    ImgBoolText(text: "Devon Lane", imageUrl: "member_image.png", value: true),
    ImgBoolText(text: "Floyd Miles", imageUrl: "member_image.png", value: false),
    ImgBoolText(text: "Bessie Cooper", imageUrl: "member_image.png", value: false),
    ImgBoolText(text: "Courtney Henry", imageUrl: "member_image.png", value: false),
  ];
  static List <AddToList>addToList=[
    AddToList(title: "Annette Black",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Theresa Webb",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Kathryn Murphy",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Ronald Richards",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Wade Warren",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Wade Warren",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Wade Warren",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Wade Warren",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
    AddToList(title: "Annette Black",subTitle: "Product Designer at TESLA",image:"member_image.png",value: false),
  ];
  static List <String>image=["event_image_1.png","event_image_2.png"];
  static List <String> category =["Category 1","Category 2","Category 3"];
  static List <ImageText> resources=[
    ImageText(text:UtilStrings.Add_Resources, image:"square_box_icon.png"),
    ImageText(text:UtilStrings.Resume_Templates, image:"business_image.png"),
    ImageText(text:UtilStrings.Business_Canvas_Templated, image:"business_image.png"),
    ImageText(text:UtilStrings.Business_Models, image:"lepi_image.png"),
    ImageText(text:UtilStrings.Others, image:"lepi_image.png"),
  ];
  static List <ImgBoolText> sendMessageResources=[
    ImgBoolText(text: UtilStrings.Annette_Blank, imageUrl: "boy_image.png", value: false),
    ImgBoolText(text: UtilStrings.Theresa_Weeb, imageUrl: "boy_image.png", value: false),
    ImgBoolText(text: UtilStrings.Kathyren_Murphy, imageUrl: "boy_image.png", value: false),
    ImgBoolText(text: UtilStrings.Ronald_Richards, imageUrl: "boy_image.png", value: false),
    ImgBoolText(text: UtilStrings.Wade_Warren, imageUrl: "boy_image.png", value: false),
  ];
  static List <InterstModel> searchList=[
    InterstModel(text:UtilStrings.All, value: true),
    InterstModel(text:UtilStrings.Posts, value: false),
    InterstModel(text:UtilStrings.Groups, value: false),
    InterstModel(text:UtilStrings.People, value: false),
    InterstModel(text:UtilStrings.Jobs, value: false),
    InterstModel(text:UtilStrings.Poll, value: false),
    InterstModel(text:UtilStrings.Events, value: false),
    InterstModel(text:UtilStrings.Resources, value: false),
  ];

}


/*'\n╔══════════════════════════ Response ══════════════════════════\n'
'╟ get >>>>> status : ${response.statusCode}\n'
'╟ response : ${response.body}\n'
'╟ Headers: ${request.headers}\n'
'╟ Body: $requestParams\n'
'╟ Status Code: ${response.status}\n'
'╟ Response body: ${response.bodyString}\n'
// '╟ Data: ${response?.bodyString?.toString() ?? ''}'
'\n╚══════════════════════════ Response ══════════════════════════\n',
);*/
