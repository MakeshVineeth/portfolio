import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:makesh_vineeth/details.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:makesh_vineeth/circleImage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ScaffoldHome extends StatelessWidget {
  static final mail = 'mailto:makeshvineeth9@gmail.com';
  static final tnLoc = 'https://goo.gl/maps/ofDShJhYNYTLYwKt8';
  static final kluAddress = 'https://goo.gl/maps/wEzAiUt8qdotkRKE7';
  static final kluWeb = 'https://www.kluniversity.in';
  static final linkedIn = 'https://www.linkedin.com/in/makeshvineeth/';
  static final bcaInfo =
      'https://en.wikipedia.org/wiki/Bachelor_of_Computer_Application';
  static final cloudInfo = 'https://www.kluniversity.in/bca/default.aspx';
  static final aboutFreelance = 'https://en.wikipedia.org/wiki/Freelancer';
  static final aboutSoftDev =
      'https://en.wikipedia.org/wiki/Software_development';

  static final infos = {
    'NAME': ['Makesh Vineeth', Icons.person, linkedIn],
    'LOCATION': ['Telangana, India', Icons.person_pin_circle_rounded, tnLoc],
    'EMAIL': ['makeshvineeth9@gmail.com', Icons.mail_rounded, mail],
    'DEVELOPMENT': ['C# and Flutter', Icons.developer_mode_rounded],
    'TYPE OF WORK': [
      'Freelancing & Full-Time',
      Icons.work_rounded,
      aboutFreelance
    ],
    'ROLE': ['Software Developer', Icons.domain_rounded, aboutSoftDev],
    'CURRENT POSITION': ['Graduated, 2020', Icons.assignment_ind_rounded],
  };

  static final eduInfos = {
    'HIGHEST QUALIFICATION': [
      'Bachelors in Computer Applications',
      Icons.school_rounded,
      bcaInfo
    ],
    'UNIVERSITY': [
      'Koneru Lakshmaiah Education Foundation',
      Icons.domain_rounded,
      kluWeb
    ],
    'UNIVERSITY LOCATION': [
      'Vijayawada, AP',
      Icons.location_on_rounded,
      kluAddress
    ],
    'SPECIALIZATION': [
      'Cloud Technology & Information Security',
      Icons.school_rounded,
      cloudInfo
    ],
    'TOTAL CGPA': ['9.58', Icons.score_rounded],
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
                  isAlwaysShown: true,
                  controller: _scrollController,
                  child: ListView.builder(
                    cacheExtent: 2000,
                    controller: _scrollController,
                    addAutomaticKeepAlives: true,
                    padding: EdgeInsets.all(5),
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
