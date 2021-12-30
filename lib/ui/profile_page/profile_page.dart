import 'package:flutter/material.dart';
class ScreenArguments {
  final String username;

  ScreenArguments(this.username);
}

class ProfilePage extends StatefulWidget {
  static const routeName = '/second';
  final String username;
  const ProfilePage({
    Key? key,
    required this.username
  }) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Response"),
      ),
      body: Text(widget.username,
        style: TextStyle(
            fontSize:30
        ),
      ),
    );
  }

}
