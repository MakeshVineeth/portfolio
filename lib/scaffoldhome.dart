import 'package:flutter/material.dart';
import 'package:makesh_vineeth/details.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:makesh_vineeth/circleImage.dart';

class ScaffoldHome extends StatelessWidget {
  final infos = {
    'NAME': ['Makesh Vineeth', Icons.person],
    'LOCATION': ['Telangana, India', Icons.location_city_rounded],
    'EMAIL': ['makeshvineeth9@gmail.com', Icons.mail_rounded],
    'DEVELOPMENT': ['C# and Flutter', Icons.developer_mode_rounded],
    'TYPE OF WORK': ['Freelancing', Icons.work_rounded],
    'ROLE': ['Software Developer', Icons.domain_rounded],
    'CURRENT POSITION': ['Graduated, 2020', Icons.assignment_ind_rounded],
  };

  final eduInfos = {
    'HIGHEST QUALIFICATION': [
      'Bachelors in Computer Applications',
      Icons.school_rounded
    ],
    'UNIVERSITY': [
      'Koneru Lakshmaiah Education Foundation',
      Icons.school_rounded
    ],
    'UNIVERSITY LOCATION': ['Vijayawada, AP', Icons.location_city_rounded],
    'SPECIALIZATION': [
      'Cloud Technology & Information Security',
      Icons.school_rounded
    ],
    'TOTAL CGPA': ['9.58', Icons.school_rounded],
  };

  final FixedValues fixedValues = FixedValues();
  final snackBar = SnackBar(content: Text('Changed to System Default Theme!'));

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: Duration(milliseconds: 1000),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            fixedValues.appTitle,
          ),
        ),
        floatingActionButton: InkWell(
          hoverColor: Colors.transparent,
          onLongPress: () => changeThemeLongPress(context),
          child: FloatingActionButton(
            onPressed: () => changeThemeTap(context),
            child: Icon(
              Icons.lightbulb_outline_rounded,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                CircleImage(),
                customDivider(),
                getColumn(infos),
                customDivider(),
                getColumn(eduInfos),
                customDivider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void changeThemeLongPress(BuildContext context) {
    AdaptiveTheme.of(context).setSystem();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void changeThemeTap(BuildContext context) {
    AdaptiveTheme.of(context).toggleThemeMode();
  }

  Widget customDivider() {
    return Divider(
      height: 45.0,
      color: Colors.grey[600],
      thickness: 1.0,
    );
  }

  Widget getColumn(final data) {
    return Column(
      children: data.entries
          .map<Widget>((entry) => Detail(
                title: entry.key,
                desc: entry.value[0],
                icon: entry.value.length == 2 ? entry.value[1] : null,
              ))
          .toList(),
    );
  }
}
