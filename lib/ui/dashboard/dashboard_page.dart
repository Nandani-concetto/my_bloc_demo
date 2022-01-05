import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/ui/common/strings.dart';
import 'package:my_bloc_demo/ui/common/widgets/app_theme.dart';
import 'package:my_bloc_demo/ui/common/widgets/assets.dart';
import 'package:my_bloc_demo/ui/common/widgets/bloc_provider.dart';
import 'dashboard_bloc.dart';

class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  final _dashboardBloc = DashboardBloc();
  late AppThemeState _appTheme;
  String password = '';
  String email = '';
  bool isWriting = false;
  int counter = 0;
  String myErrorString = "";
  late TextSelection currentPosition;

  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    _appTheme = AppTheme.of(context);
    return BlocProvider<DashboardBloc>(
      bloc: _dashboardBloc,
      onInternetReConnected: () {},
      child: Scaffold(
          backgroundColor: _appTheme.whiteColor,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(300.0.h), child: buildAppBar()),
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
        preferredSize: Size.fromHeight(0.h),
        child: buildTitleSubTitle(),
      ),
    );
  }

  Widget getRectangleImage() {
    return Image(
      image: AssetImage(Assets.rectangle),
      fit: BoxFit.cover,
      height: 300.h,
      width: 414.sw,
    );
  }

  Widget buildAppBarBorder() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(45.w)),
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
      image: AssetImage(Assets.layer),
      fit: BoxFit.cover,
      height: 150.h,
      //width: 180,
    );
  }

  Widget getBackButton() {
    return Padding(
      padding: EdgeInsets.only(top: 27.w, left: 32.w),
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
        padding: EdgeInsets.only(top: 32.84.w, right: 32.w),
        child: Text(StringConstants.signup, style: _appTheme.signupTextStyle),
      ),
    );
  }

  Widget buildTitleSubTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(bottom: 63.58.w, left: 33.w),
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
          text: StringConstants.doYou,
          style: _appTheme.doyouTextStyle,
          children: <TextSpan>[
            TextSpan(text: StringConstants.login, style: _appTheme.login)
          ]),
    );
  }

  Widget buildBody() {
    return Form(
      // key: formKey,
      child: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
          _dashboardBloc.isLoginPressed = false;
        }
        if (_dashboardBloc.isLoginPressed) {
        } else {
          isWriting = true;
          _dashboardBloc.isLoginPressed = false;
          myErrorString = "";
        }
      },
    );
  }

  Widget buildBoxOfEmail() {
    return Padding(
      padding: EdgeInsets.only(top: 10.w, left: 32.w, right: 32.w),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            //spreadRadius: 10,
            blurRadius: 10,
          )
        ]),
        child: TextFormField(
          key: _dashboardBloc.emailKey,
          controller: _dashboardBloc.emailController,
          onChanged: (value) {
            email = value;
          },
          onSaved: (value) {
            email = value!;
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
                  _dashboardBloc.emailController.clear();
                }),
          ),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          validator: (value) {
            return _dashboardBloc.emailValidation(value);
          },
        ),
      ),
    );
  }

  Widget buildBoxOfPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 30.w, left: 32.w, right: 32.w),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 10,
          ),
        ]),
        child: Column(
          children: <Widget>[
            StreamBuilder<bool>(
                stream: _dashboardBloc.buttonStream,
                builder: (context, snapshot) {
                  return TextFormField(
                    key: _dashboardBloc.passwordKey,
                    obscureText: snapshot.data ?? true,
                    controller: _dashboardBloc.passWordController,
                    onChanged: (value) {
                      password = value;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70),
                        ),
                        labelText: StringConstants.lableOfPassword,
                        labelStyle: _appTheme.lableOfPassWord,
                        suffixIcon: IconButton(
                          icon: snapshot.data ?? true
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            _dashboardBloc.buttonStreamController.sink
                                .add(!(snapshot.data ?? false));
                            print("${!(snapshot.data ?? false)}");
                          },
                        )),
                    validator: (value) {
                      return _dashboardBloc.passWordValidation(value);
                    },
                  );
                }),
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
      padding: EdgeInsets.only(left: 32.w, right: 32.w, top: 50.w),
      child: Container(
          height: 56.h,
          width: 350.sw,
          child: StreamBuilder<Details?>(
            initialData: null,
            stream: _dashboardBloc.postStream,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  Container(
                      height: 56.h,
                      width: 350.sw,
                      child: ElevatedButton(
                        onPressed: () async {
                          counter = 1;
                          isWriting = false;
                          _dashboardBloc.isLoginPressed = true;
                          final isValid =
                              _dashboardBloc.emailKey.currentState!.validate();
                          if (isValid) {
                            snapshot.data ?? false;
                            _dashboardBloc.emailKey.currentState!.save();
                            final success = _dashboardBloc
                                .passwordKey.currentState!
                                .validate();
                            if (success) {
                              _dashboardBloc.indicatorStreamController.sink
                                  .add(true);
                              _dashboardBloc.passwordKey.currentState!.save();
                              _dashboardBloc.fetchDetails(
                                  _dashboardBloc.emailController.text,
                                  password,
                                  context,
                                  displayDialog);
                              await Future.delayed(const Duration(seconds: 1));
                              _dashboardBloc.indicatorStreamController.sink
                                  .add(false);
                              print(
                                  "Email : ${_dashboardBloc.emailController.text}");
                              print("PassWord : ${password}");
                            }
                          } else {}
                        },
                        style:
                            ElevatedButton.styleFrom(primary: _appTheme.black),
                        child: Text(StringConstants.loginOnButton,
                            style: _appTheme.loginOnButton),
                      )),
                  Center(
                    child: StreamBuilder<bool>(
                        stream: _dashboardBloc.indicatorStream,
                        initialData: false,
                        builder: (context, snapshot) {
                          print(snapshot.data);
                          if (snapshot.data != null) {
                            return snapshot.data!
                                ? CircularProgressIndicator()
                                : SizedBox();
                          } else {
                            return SizedBox();
                          }
                        }),
                  )
                ],
              );
            },
          )),
    );
  }

  Widget grtBackgroundImage() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        margin: EdgeInsets.only(left: 33.6.w, top: 40.95.w),
        child: (Image.asset(
          "assets/images/Layer 6_1.png",
          fit: BoxFit.cover,
          color: _appTheme.black,
          height: 416.51.h,
          width: 550.68.sw,
        )),
      ),
    );
  }

  displayDialog(BuildContext context, String message) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Welcome'),
            children: [
              SimpleDialogOption(
                child: Text(
                  message,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 210.w),
                  child: Text("OK"),
                ),
              ),
            ],
            // elevation: 10,
          );
        });
  }
}
