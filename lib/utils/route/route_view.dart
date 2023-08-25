import 'package:emba/module/home/leaderboard/learderboard_screen.dart';
import 'package:emba/utils/route/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../module/chat/archived_chat_screen.dart';
import '../../module/chat/block_chat_screen.dart';
import '../../module/chat/chat_list_screen.dart';
import '../../module/chat/chat_screen.dart';
import '../../module/groups/group_details/group_members/filter/filter_screen.dart';
import '../../module/groups/group_details/group_members/filter/industry/industry_screen.dart';
import '../../module/groups/group_details/group_members/group_members_screen.dart';
import '../../module/groups/group_settings/change_privacy/change_privacy_screen.dart';
import '../../module/groups/group_settings/edit_group_detail/edit_group_details_screen.dart';
import '../../module/groups/group_settings/group_settings_screen.dart';
import '../../module/groups/group_settings/pending_approvals/pending_approvals_screen.dart';
import '../../module/groups/group_settings/report_posts/report_posts_screen.dart';
import '../../module/home/bottom_navigation_bar.dart';
import '../../module/home/comments/comment_screen.dart';
import '../../module/home/events/events_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/edit_contact_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/edit_education.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/edit_netwok_detail_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/edit_profile_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/jioned_group_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/jobs_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/manage_contact_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/manage_profile_detail_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/my_block_list_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/my_connection_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/organization_detail_screen.dart';
import '../../module/home/profile/my_profile/manage_profile_detail/posts_screen.dart';
import '../../module/home/profile/my_profile/view_profile.dart';
import '../../module/home/profile/otherProfile/other_connection_screen.dart';
import '../../module/home/profile/otherProfile/other_groups.dart';
import '../../module/home/profile/otherProfile/other_organtization_screen.dart';
import '../../module/home/profile/otherProfile/other_similarities_screen.dart';
import '../../module/home/resources/resources_screen.dart';
import '../../module/home/resources/widgets/resume_templates_screen.dart';
import '../../module/home/resources/widgets/send_message_screen.dart';
import '../../module/jobs/filtter_screen.dart';
import '../../module/jobs/job_detail_screen.dart';
import '../../module/login/forgotpassword/forgot_password_screen.dart';
import '../../module/login/forgotpassword/otp_screen.dart';
import '../../module/login/login_screen.dart';
import '../../module/network/network_widget/add_to_list/add_to_list_screen.dart';
import '../../module/network/network_widget/network_filter/network_filter_apply/network_filter_apply_screen.dart';
import '../../module/network/network_widget/network_filter/network_filter_screen.dart';
import '../../module/scheduled_meeting/scheduled_screen.dart';
import '../../module/selection/selection_screen.dart';
import '../../module/set_preference/select_entrepreneurship_screen.dart';
import '../../module/set_preference/select_functions_screen.dart';
import '../../module/set_preference/select_industries_screen.dart';
import '../../module/set_preference/select_location_screen.dart';
import '../../module/set_preference/select_school_screen.dart';
import '../../module/setting/about_us_screen.dart';
import '../../module/setting/change_password_screen.dart';
import '../../module/setting/login_activity.dart';
import '../../module/setting/notification_settings.dart';
import '../../module/setting/security.dart';
import '../../module/setting/settings.dart';
import '../../module/setting/terms_and_condition.dart';
import '../../module/signup/other_details_verification/setup_education_details.dart';
import '../../module/signup/pick_ur_interst/pick_ur_interst_screen.dart';
import '../../module/signup/signup_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.SelectionScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SelectionScreen(),
        );
        case RouteName.LoginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
        case RouteName.SignupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
        case RouteName.PickInterstScreen:
        return MaterialPageRoute(
          builder: (_) => PickInterstScreen(),
        );
        case RouteName.BottomNavigationBarScreen:
        return MaterialPageRoute(
          builder: (_) => const BottomNavigationBarScreen(),
        );
        case RouteName.ViewProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const ViewProfileScreen(),
        );
        case RouteName.ManageProfileDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const ManageProfileDetailScreen(),
        );
      case RouteName.setting:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case RouteName.security:
        return MaterialPageRoute(
          builder: (_) => const SecurityScreen(),
        );
      case RouteName.login_activity:
        return MaterialPageRoute(
          builder: (_) => const LoginActivityScreen(),
        );
      case RouteName.password:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      case RouteName.about_us:
        return MaterialPageRoute(
          builder: (_) => const AboutUsScreen(),
        );
      case RouteName.terms_condition:
        return MaterialPageRoute(
          builder: (_) => const TermsAndConditionScreen(),
        );
        case RouteName.NotificationSettingScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationSettingScreen(),
        );
        case RouteName.OrganizationDetailScreen:
        return MaterialPageRoute(
          builder: (_) => const OrganizationDetailScreen(),
        );
        case RouteName.ManageContactScreen:
        return MaterialPageRoute(
          builder: (_) => const ManageContactScreen(),
        ); case RouteName.EditContactScreen:
        return MaterialPageRoute(
          builder: (_) =>  EditContactScreen(),
        );
        case RouteName.EditProfileScreen:
        return MaterialPageRoute(
          builder: (_) =>  EditProfileScreen(),
        );
        case RouteName.PostScreen:
        return MaterialPageRoute(
          builder: (_) => const PostScreen(),
        );
 case RouteName.MyConnectionScreen:
        return MaterialPageRoute(
          builder: (_) => const MyConnectionScreen(),
        );
        case RouteName.MyBlockListScreen:
        return MaterialPageRoute(
          builder: (_) => const MyBlockListScreen(),
        );
        case RouteName.JionedGroupScreen:
        return MaterialPageRoute(
          builder: (_) => const JionedGroupScreen(),
        );
        case RouteName.JobScreen:
        return MaterialPageRoute(
          builder: (_) => const JobScreen(),
        );case RouteName.EditNetworkScreen:
        return MaterialPageRoute(
          builder: (_) =>  EditNetworkScreen(),
        );case RouteName.ForgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );case RouteName.OtpScreen:
        return MaterialPageRoute(
          builder: (_) =>  OtpScreen(),
        );case RouteName.OtherGroupScreen:
        return MaterialPageRoute(
          builder: (_) =>  const OtherGroupScreen(),
        );case RouteName.OtherConnectionScreen:
        return MaterialPageRoute(
          builder: (_) =>  const OtherConnectionScreen(),
        );case RouteName.SimilariteisScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SimilariteisScreen(),
        );case RouteName.OtherOrganizationScreen:
        return MaterialPageRoute(
          builder: (_) =>  const OtherOrganizationScreen(),
        );case RouteName.CommentScreen:
        return MaterialPageRoute(
          builder: (_) =>  const CommentScreen(),
        );case RouteName.SelectLocationScreen:
        return MaterialPageRoute(
          builder: (_) =>   SelectLocationScreen(),
        );case RouteName.SelectIndustriesScreen:
        return MaterialPageRoute(
          builder: (_) =>   SelectIndustriesScreen(),
        );case RouteName.SelectFunctionsScreen:
        return MaterialPageRoute(
          builder: (_) =>   SelectFunctionsScreen(),
        );case RouteName.SelectEntrepreneurshipScreen:
        return MaterialPageRoute(
          builder: (_) =>   SelectEntrepreneurshipScreen(),
        );
      case RouteName.EditGroupDetailsScreen:
        return MaterialPageRoute(
          builder: (_) =>  const EditGroupDetailsScreen(),
        );case RouteName.ChangePrivacyScreen:
      return MaterialPageRoute(
        builder: (_) =>  const ChangePrivacyScreen(),
      );case RouteName.PendingApprovalsScreen:
      return MaterialPageRoute(
        builder: (_) =>  const PendingApprovalsScreen(),
      );case RouteName.ReportPostsScreen:
      return MaterialPageRoute(
        builder: (_) =>  const ReportPostsScreen(),
      );case RouteName.GroupSettingsScreen:
      return MaterialPageRoute(
        builder: (_) =>  const GroupSettingsScreen(),
      );
      // New //
      case RouteName.GroupMembersScreen:
      return MaterialPageRoute(
        builder: (_) =>  const GroupMembersScreen(),
      );case RouteName.FilterScreen:
      return MaterialPageRoute(
        builder: (_) =>  const FilterScreen(),
      );case RouteName.IndustryScreen:
      return MaterialPageRoute(
        builder: (_) =>  const IndustryScreen(),
      );case RouteName.EventsScreen:
      return MaterialPageRoute(
        builder: (_) =>  const EventsScreen(),
      );case RouteName.JobDetailScreen:
      return MaterialPageRoute(
        builder: (_) =>  const JobDetailScreen(),
      );case RouteName.FilterJobScreen:
      return MaterialPageRoute(
        builder: (_) =>  const FilterJobScreen(),
      );case RouteName.SelectSchoolScreen:
      return MaterialPageRoute(
        builder: (_) =>  const SelectSchoolScreen(),
      );case RouteName.LeaderBoardScreen:
      return MaterialPageRoute(
        builder: (_) =>  const LeaderBoardScreen(),
      );case RouteName.AddToListScreen:
      return MaterialPageRoute(
        builder: (_) =>  const AddToListScreen(),
      );case RouteName.NetworkFilterScreen:
      return MaterialPageRoute(
        builder: (_) =>  const NetworkFilterScreen(),
      );case RouteName.NetworkFilterApplyScreen:
      return MaterialPageRoute(
        builder: (_) =>  const NetworkFilterApplyScreen(),
      );case RouteName.ResourcesScreen:
      return MaterialPageRoute(
        builder: (_) =>  const ResourcesScreen(),
      );case RouteName.ArchivedChatScreen:
      return MaterialPageRoute(
        builder: (_) =>  const ArchivedChatScreen(),
      );case RouteName.BlockListChatScreen:
        return MaterialPageRoute(
          builder: (_) =>  const BlockListChatScreen(),
        );case RouteName.ChatScreen:
        return MaterialPageRoute(
          builder: (_) =>  const ChatScreen(),
        );case RouteName.ChatListScreen:
        return MaterialPageRoute(
          builder: (_) =>  const ChatListScreen(),
        );
        case RouteName.SendMessageScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SendMessageScreen(),
        ); case RouteName.SetudEducationsDetailsScreen:
        return MaterialPageRoute(
          builder: (_) =>  const SetudEducationsDetailsScreen(),
        );case RouteName.ScheduledScreen:
        return MaterialPageRoute(
          builder: (_) =>  const ScheduledScreen(),
        );
        ///directory materialPageRoutes end here
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}