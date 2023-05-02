import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final title;
  final desc;
  final icon;
  final url;

  const Detail(
      {@required this.title, @required this.desc, this.icon, this.url, Key? key})
      : super(key: key);

  static _launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (e) {}
  }

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> with AutomaticKeepAliveClientMixin {
  final FixedValues fixedValues = FixedValues();
  final BorderRadius borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      margin: EdgeInsets.all(5.0),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          if (this.widget.url != null) Detail._launchURL(this.widget.url);
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
                    widget.title,
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
                    if (this.widget.icon != null)
                      Icon(
                        this.widget.icon,
                        size: 18.0,
                      ),
                    SizedBox(
                      width: 5.0,
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          widget.desc,
                          textStyle: fixedValues.textStyle(context),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
