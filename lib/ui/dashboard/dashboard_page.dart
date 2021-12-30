import 'package:flutter/material.dart';
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/ui/common/strings.dart';
import 'package:my_bloc_demo/ui/common/widgets/app_theme.dart';
import 'package:my_bloc_demo/ui/common/widgets/bloc_provider.dart';
import 'package:my_bloc_demo/ui/common/widgets/shimmer_widget.dart';

import 'dashboard_bloc.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final _dashboardBloc = DashboardBloc();
  late AppThemeState _appTheme;
  final TextEditingController controller = TextEditingController();
  var emailController = TextEditingController();
  String password = '';
  String email = '';
  bool isPasswordVisible = false;
  bool isError = false;
  bool isWriting = false;
  bool isLoginPressed = false;
  int counter = 0;
  String myErrorString = "";
  late TextSelection currentPosition;
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();
  var selected = "";
  @override
  Widget build(BuildContext context) {
    _appTheme = AppTheme.of(context);
    return BlocProvider<DashboardBloc>(
      bloc: _dashboardBloc,
      onInternetReConnected: () {},
      child: Scaffold(
          backgroundColor: _appTheme.whiteColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(300.0), child: buildAppBar()),
          body: buildBody()),
    );
  }
  Widget buildAppBar() {
    return AppBar(
      backgroundColor: _appTheme.whiteColor,
      elevation: 0,
      flexibleSpace: buildAppBarBorder(),
      leading: getBackButton(),
      actions: [
        getSignUp(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: buildTitleSubTitle(),
      ),
    );
  }
  Widget getRectangleImage() {
    return Image(
      image: AssetImage("assets/images/Rectangle 1.png"),
      fit: BoxFit.cover,
      height: 300,
      width: 414,
    );
  }
  Widget buildAppBarBorder() {
    return ClipRRect(
      borderRadius:
          BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(45)),
      child: Stack(
        children: [
          getRectangleImage(),
          getBoxImage(),
        ],
      ),
    );
  }
  Widget getBoxImage() {
    return Image(
      image: AssetImage("assets/images/Layer 6.png"),
      fit: BoxFit.cover,
      height: 150,
      //width: 180,
    );
  }
  Widget getBackButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 27.0, left: 32),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: _appTheme.whiteColor),
        onPressed: () {},
        //onPressed: ()
      ),
    );
  }
  Widget getSignUp() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 32.84, right: 32),
        child: Text(StringConstants.signup, style: _appTheme.signupTextStyle),
      ),
    );
  }
  Widget buildTitleSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 63.58, left: 33),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBarTitle(),
          buildAppBarSubTitle(),
        ],
      ),
    );
  }
  Widget buildAppBarTitle() {
    return Text(StringConstants.loginText, style: _appTheme.loginTextStyle);
  }
  Widget buildAppBarSubTitle() {
    return RichText(
      text: TextSpan(
          text: StringConstants.doyou,
          style: _appTheme.doyouTextStyle,
          children: <TextSpan>[
            TextSpan(text: StringConstants.login, style: _appTheme.login)
          ]),
    );
  }
  Widget buildBody() {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildBoxOfEmail(),
                  Column(
                    children: [
                      buildBoxOfPassword(),
                    ],
                  ),
                  buildForgotAccountLabel(),
                  Stack(children: [
                    grtBackgroundImage(),
                    getLoginButton(),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
      onChanged: () {
        counter++;
        if (counter == 2) {
          counter = 0;
          isLoginPressed = false;
        }
        if (isLoginPressed) {
        } else {
          isWriting = true;
          isLoginPressed = false;
          myErrorString = "";
        }
      },
    );
  }
  Widget buildBoxOfEmail() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 32, right: 32),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            //spreadRadius: 10,
            blurRadius: 10,
          )
        ]),
        child: TextFormField(
          key: emailKey,
          controller: emailController,
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          onSaved: (value) {
            setState(() {
              email = value!;
            });
          },
          decoration: InputDecoration(
            hintText: StringConstants.hintTextOfEmail,
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _appTheme.white70),
            ),
            labelText: StringConstants.lableOfEmail,
            labelStyle: _appTheme.lableOfEmail,
            suffixIcon: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  emailController.clear();
                }),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: (value) {
            if (isLoginPressed) {
              isError = true;
              if (value!.isEmpty) {
                myErrorString = 'Email is Empty';
                return myErrorString;
              } else if (!RegExp(
                      r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                  .hasMatch(value)) {
                myErrorString = 'Please Enter valid Email';
                return myErrorString;
              }
              isError = false;
              myErrorString = "";
            } else {
              myErrorString = "";
            }
            return null;
          },
        ),
      ),
    );
  }
  Widget buildBoxOfPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 30, left: 32, right: 32),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
          ),
        ]),
        child: Column(
          children: <Widget>[
            TextFormField(
              key: passwordKey,
              controller: controller,
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              onSaved: (value) {
                setState(() {
                  password = value!;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: StringConstants.lableOfPassword,
                  labelStyle: _appTheme.lableOfPassWord,
                  suffixIcon: IconButton(
                    icon: isPasswordVisible
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  )),
              obscureText: isPasswordVisible,
              validator: (value) {
                myErrorString = "";
                if (isLoginPressed) {
                  isError = true;
                  if (value!.isEmpty) {
                    myErrorString = 'Please Enter Password';
                    return myErrorString;
                  } else if (value.length < 6) {
                    myErrorString =
                        'Password must be at least 6 character long';
                    //validateMe();
                    return myErrorString;
                  }
                  isError = false;
                  myErrorString = "";
                } else {
                  myErrorString = "";
                }
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget buildForgotAccountLabel() {
    return FlatButton(
      color: _appTheme.whiteColor,
      onPressed: () {},
      child: Text(StringConstants.forgotten, style: _appTheme.forgot),
    );
  }
  Widget getLoginButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 50),
      child: Container(
          height: 56,
          width: 350,

          child: StreamBuilder<Details?>(
            initialData: null,
            stream: _dashboardBloc.postStream,
            builder: (context, snapshot) {
              return ElevatedButton(
                onPressed: () {
                  counter = 1;
                  isWriting = false;
                  isLoginPressed = true;
                  final isValid = emailKey.currentState!.validate();
                  if (isValid) {
                    emailKey.currentState!.save();
                    final success = passwordKey.currentState!.validate();
                    if (success) {
                      passwordKey.currentState!.save();
                      _dashboardBloc.fetchDetails(
                          emailController.text, password,context);
                      print("Email : ${emailController.text}");
                      print("PassWord : ${password}");
                    }
                  }
                },
                style: ElevatedButton.styleFrom(primary: _appTheme.black),
                child: Text(StringConstants.loginonbutton,
                    style: _appTheme.loginOnButton),
              );
            },
          )),
    );
  }
  Widget grtBackgroundImage() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        //color: Colors.black,
        margin: const EdgeInsets.only(left: 33.6, top: 40.95),
        child: (Image.asset(
          "assets/images/Layer 6_1.png",
          fit: BoxFit.cover,
          color: _appTheme.black,
          height: 416.51,
          width: 550.68,
        )),
      ),
    );
  }
}
