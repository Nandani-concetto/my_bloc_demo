import 'package:flutter/cupertino.dart';
import 'package:my_bloc_demo/ui/dashboard/dashboard_page.dart';
import 'package:my_bloc_demo/ui/profile_page/profile_page.dart';

class RouteName {
  // Base routes
  static final String root = "/";
  static final String profilePage = "/profile";
}

class Routes {
  static final baseRoutes = <String, WidgetBuilder>{
    RouteName.root: (context) => DashboardPage(),
    RouteName.profilePage: (context) => ProfilePage(username: '',),
  };
  static final commonRoutes = <String, WidgetBuilder>{};
}