import 'package:flutter/material.dart';
import 'package:makesh_vineeth/details.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class ScaffoldHome extends StatelessWidget {
  final infos = {
    'NAME': 'Makesh Vineeth',
    'COUNTRY': 'India',
    'EMAIL': 'makeshvineeth9@gmail.com',
    'DEVELOPMENT': '.NET and Flutter',
    'TYPE OF WORK': 'On-demand Freelancing',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Makesh Vineeth Portfolio',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
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
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius: 70.0,
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
                          desc: entry.value,
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
