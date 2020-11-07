import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final title;
  final desc;
  final icon;
  final url;

  Detail(
      {@required this.title, @required this.desc, this.icon, this.url, Key key})
      : super(key: key);

  final FixedValues fixedValues = FixedValues();
  final BorderRadius borderRadius = BorderRadius.circular(25);
  static _launchURL(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    double winSize = MediaQuery.of(context).size.width;
    return Container(
      width: (winSize > 600) ? winSize / 2 : winSize,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        margin: EdgeInsets.all(5.0),
        elevation: 5.0,
        child: InkWell(
          onTap: () {
            if (this.url != null) _launchURL(this.url);
          },
          borderRadius: borderRadius,
          child: IgnorePointer(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      title,
                      style: fixedValues.headingStyle(context),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (this.icon != null)
                        Icon(
                          this.icon,
                          size: 18.0,
                        ),
                      SizedBox(
                        width: 5.0,
                      ),
                      TypewriterAnimatedTextKit(
                        text: [desc],
                        textStyle: fixedValues.textStyle(context),
                        textAlign: TextAlign.center,
                        alignment: AlignmentDirectional.center,
                        displayFullTextOnTap: true,
                        isRepeatingAnimation: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
