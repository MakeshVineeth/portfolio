import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';

class Detail extends StatelessWidget {
  final title;
  final desc;

  Detail({@required this.title, @required this.desc});

  final FixedValues fixedValues = FixedValues();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: EdgeInsets.all(5.0),
      elevation: 5.0,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
              Center(
                child: Text(
                  desc,
                  style: fixedValues.textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
