import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';
  final String username;

  const ProfilePage({Key? key, required this.username}) : super(key: key);

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
      body: Text(
        widget.username,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
