import 'package:flutter/material.dart';
import 'package:makesh_vineeth/details.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:makesh_vineeth/circleImage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ScaffoldHome extends StatelessWidget {
  static final mail = 'mailto:makeshvineeth9@gmail.com';
  static final tnLoc = 'https://goo.gl/maps/ofDShJhYNYTLYwKt8';
  static final topAddress = 'https://goo.gl/maps/w88i6goJzJnfaavb6';
  static final topWeb = 'https://www.amity.edu/';
  static final linkedIn = 'https://www.linkedin.com/in/makeshvineeth/';
  static final degInfo =
      'https://www.amity.edu/course-details.aspx?fd=FzNymoX3dH0=&cfn=rq3kzaCPdYSngjgUzM2Drw==&CD=rq3kzaCPdYSngjgUzM2Drw==';

  static final infos = {
    'NAME': ['Makesh Vineeth', Icons.person, linkedIn],
    'LOCATION': ['Telangana, India', Icons.person_pin_circle_rounded, tnLoc],
    'EMAIL': ['makeshvineeth9@gmail.com', Icons.mail_rounded, mail],
    'DEVELOPMENT': ['.NET and Flutter', Icons.developer_mode_rounded],
    'TYPE OF WORK': [
      'Full-Time',
      Icons.work_rounded,
    ],
    'CURRENT POSITION': ['Student Intern at Saxo Group India', Icons.assignment_ind_rounded],
  };

  static final eduInfos = {
    'HIGHEST QUALIFICATION': [
      'Masters in Computer Applications',
      Icons.school_rounded,
      degInfo
    ],
    'UNIVERSITY': ['Amity University', Icons.domain_rounded, topWeb],
    'UNIVERSITY LOCATION': ['Noida, UP', Icons.location_on_rounded, topAddress],
  };

  final FixedValues fixedValues = FixedValues();
  final snackBar = SnackBar(content: Text('Changed to System Default Theme!'));
  final List<Widget> ui = getUiList();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double winSize = MediaQuery.of(context).size.width;

    return FadeIn(
      duration: Duration(milliseconds: 1000),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            fixedValues.appTitle,
          ),
        ),
        body: AnimationLimiter(
          child: Center(
            child: Container(
              width: (winSize > 600) ? winSize / 2 : winSize,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    cacheExtent: 2000,
                    controller: _scrollController,
                    addAutomaticKeepAlives: true,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    scrollDirection: Axis.vertical,
                    physics: AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount: ui.length,
                    itemBuilder: (context, index) =>
                        AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(seconds: 1),
                      child: SlideAnimation(
                        horizontalOffset: MediaQuery.of(context).size.width / 3,
                        child: FadeInAnimation(
                          child: ui[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static List<Widget> getUiList() {
    List<Widget> ui = [];
    ui.add(CircleImage());
    ui.addAll(getDetailsList(infos));
    ui.add(customDivider());
    ui.addAll(getDetailsList(eduInfos));
    return ui;
  }

  static Widget customDivider() => Divider(
        height: 45.0,
        color: Colors.grey[600],
        thickness: 1.0,
      );

  static List<Widget> getDetailsList(final data) => data.entries
      .map<Widget>((entry) => Detail(
            title: entry.key,
            desc: entry.value[0],
            icon: entry.value[1],
            url: entry.value.length == 3 ? entry.value[2] : null,
          ))
      .toList();
}
