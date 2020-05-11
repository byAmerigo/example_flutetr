import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: Center(
          child: Text(
        'Profile page',
        style: Theme.of(context).textTheme.headline4,
      )),
    );
  }
}
