import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Center(
          child: Text(
        'Settings page',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
