import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';

class Detail extends StatelessWidget {
  final title;
  final desc;

  const Detail({@required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: EdgeInsets.all(5.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                title,
                style: FixedValues.headingStyle,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Center(
              child: Text(
                desc,
                style: FixedValues.textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
