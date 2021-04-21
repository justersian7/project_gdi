import 'package:flutter/material.dart';
import 'package:project/constant.dart';

import '../../size_config.dart';
import './components/body.dart';

class ProjectHomeScreen extends StatelessWidget {
  static String routeName = '/project_home';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: SafeArea(
          child: AppBar(
            flexibleSpace: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: getScreenWidth(20),
                  child: Container(
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: getScreenWidth(20),
                  bottom: 0,
                  top: 0,
                  child: PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: kPrimaryColor,
                            ),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 1.5,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(getScreenWidth(10)),
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Body(),
    );
  }
}
