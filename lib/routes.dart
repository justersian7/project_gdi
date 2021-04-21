import 'package:flutter/material.dart';
import 'package:project/screens/Create_Project/create_project_screen.dart';
import 'package:project/screens/Project_Home/project_home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  ProjectHomeScreen.routeName: (context) => ProjectHomeScreen(),
  CreateProjectScreen.routeName: (context) => CreateProjectScreen(),
};
