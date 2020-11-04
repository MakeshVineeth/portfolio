import 'package:flutter/material.dart';
import 'package:makesh_vineeth/fixedValues.dart';

class Detail extends StatelessWidget {
  final title;
  final desc;
  final icon;

  Detail({@required this.title, @required this.desc, @required this.icon});

  final FixedValues fixedValues = FixedValues();

  @override
  Widget build(BuildContext context) {
    double winSize = MediaQuery.of(context).size.width;
    return Container(
      width: (winSize > 600) ? winSize / 2 : winSize,
      child: Card(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      this.icon,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      desc,
                      style: fixedValues.textStyle,
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
}
