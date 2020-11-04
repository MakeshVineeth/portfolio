import 'package:flutter/material.dart';
import 'package:makesh_vineeth/details.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:makesh_vineeth/fixedValues.dart';

class ScaffoldHome extends StatelessWidget {
  final infos = {
    'NAME': ['Makesh Vineeth', Icons.person],
    'LOCATION': ['Telangana, India', Icons.location_city_rounded],
    'EMAIL': ['makeshvineeth9@gmail.com', Icons.mail_rounded],
    'DEVELOPMENT': ['C# and Flutter', Icons.developer_mode_rounded],
    'TYPE OF WORK': ['Freelancing', Icons.work_rounded],
    'ROLE': ['Software Developer', Icons.domain_rounded],
    'CURRENT POSITION': ['Graduate, 2020', Icons.assignment_ind_rounded],
  };

  final FixedValues fixedValues = FixedValues();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          fixedValues.appTitle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AdaptiveTheme.of(context).toggleThemeMode();
        },
        child: Icon(
          Icons.lightbulb_outline_rounded,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 80.0,
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.grey[600],
              ),
              Column(
                children: infos.entries
                    .map((entry) => Detail(
                          title: entry.key,
                          desc: entry.value[0],
                          icon: entry.value[1],
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
