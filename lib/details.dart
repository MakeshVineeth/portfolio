import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

class Detail extends StatelessWidget {
  final title;
  final desc;
  final icon;

  Detail({@required this.title, @required this.desc, this.icon});

  final FixedValues fixedValues = FixedValues();
  final BorderRadius borderRadius = BorderRadius.circular(25);

  @override
  Widget build(BuildContext context) {
    double winSize = MediaQuery.of(context).size.width;
    return FadeIn(
      duration: Duration(milliseconds: 1500),
      child: Container(
        width: (winSize > 600) ? winSize / 2 : winSize,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          margin: EdgeInsets.all(5.0),
          elevation: 5.0,
          child: InkWell(
            onTap: () {},
            borderRadius: borderRadius,
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
                        speed: Duration(milliseconds: 150),
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
