import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Card(
          shape: CircleBorder(),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: OctoImage.fromSet(
              image: AssetImage('assets/profile.jpg'),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.cover,
              octoSet: OctoSet.circleAvatar(
                backgroundColor: Colors.transparent,
                text: Text(''),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
