import 'package:flutter/material.dart';
import 'package:project/size_config.dart';

import 'create_project_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getScreenWidth(10),
                ),
                CreateProjectForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
