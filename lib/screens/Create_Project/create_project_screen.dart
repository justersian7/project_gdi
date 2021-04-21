import 'package:flutter/material.dart';

import 'components/body.dart';

class CreateProjectScreen extends StatelessWidget {
  static String routeName = '/create_project';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Project'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Body(),
    );
  }
}
