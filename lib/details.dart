import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixed_values.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final String title;
  final String desc;
  final IconData? icon;
  final String? url;

  const Detail({
    required this.title,
    required this.desc,
    this.icon,
    this.url,
    super.key,
  });

  static _launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      await launchUrl(uri);
    } catch (_) {}
  }

  @override
  DetailState createState() => DetailState();
}

class DetailState extends State<Detail> with AutomaticKeepAliveClientMixin {
  final FixedValues fixedValues = FixedValues();
  final BorderRadius borderRadius = BorderRadius.circular(20);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      margin: EdgeInsets.all(5.0),
      elevation: 2.0,
      child: InkWell(
        onTap: () {
          if (widget.url != null) {
            Detail._launchURL(widget.url!);
          }
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
                SizedBox(height: 5.0),
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.icon != null) Icon(widget.icon, size: 18.0),
                        SizedBox(width: 5.0),
                        Text(
                          widget.desc,
                          style: fixedValues.textStyle(context),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
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
