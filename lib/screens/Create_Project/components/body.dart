import 'package:flutter/material.dart';

import 'create_project_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: CreateProjectForm(),
      ),
    );
  }
}
