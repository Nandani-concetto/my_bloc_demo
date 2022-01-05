import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_bloc_demo/di/app_component_base.dart';
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/models/user_request.dart';
import 'package:my_bloc_demo/ui/common/app_exception.dart';
import 'package:my_bloc_demo/ui/common/strings.dart';
import 'package:my_bloc_demo/ui/common/widgets/bloc_provider.dart';
import 'package:my_bloc_demo/ui/profile_page/profile_page.dart';

class DashboardBloc extends BlocBase {
  final _postListStreamController = StreamController<Details?>();
  final buttonStreamController = StreamController<bool>();
  final indicatorStreamController = StreamController<bool>();

  bool isLoginPressed = false;
  bool isError = false;
  String myErrorString = "";
  var passWordController = TextEditingController();
  var emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final passwordKey = GlobalKey<FormFieldState>();

  Stream<Details?> get postStream => _postListStreamController.stream;
  Stream<bool> get buttonStream => buttonStreamController.stream;
  Stream<bool> get indicatorStream => indicatorStreamController.stream;

  @override
  void initData() {
    super.initData();
  }

  @override
  void dispose() {
    _postListStreamController.close();
    buttonStreamController.close();
    indicatorStreamController.close();
  }

  fetchDetails(String username, String password, BuildContext context,
      Function displayDialog) {
    _postListStreamController.sink.add(null);
    AppComponentBase.getInstance()
        .getApiInterface()
        .getPostRepository()
        .getLogin(UserRequest(
          username: username,
          password: password,
          deviceId:
              "fugvk9qw2vk:apa91bg5duiltd0e-nt5yqknuocuymtqdkgugv5ylx74-arlhpliekbm-zfio3l7ntbihtttvitm5dc6hc2bwgea-tylqamvjw4jthubyl9jikphfskcsgrlr6266voo1hexcq6y821m",
          deviceType: "1",
        ))
        .then((details) {
      _postListStreamController.sink.add(details);
      print(username);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(username: username)));
    }).catchError((error) {
      _postListStreamController.sink.addError(error);
      if (error is PostException) {
        print(error.message);
        displayDialog(context, error.message);
      } else if (error is Positioned) {
        CircularProgressIndicator();
      }
      print("Error is $error");
    });
  }
  emailValidation(value) {
    if (isLoginPressed) {
      isError = true;
      if (value!.isEmpty) {
        myErrorString = StringConstants.emailEmpty;
        return myErrorString;
      } else if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
          .hasMatch(value)) {
        myErrorString = StringConstants.validEmail;
        return myErrorString;
      }
      isError = false;
      myErrorString = "";
    } else {
      myErrorString = "";
    }
    return null;
  }
  passWordValidation(value) {
    myErrorString = "";
    if (isLoginPressed) {
      isError = true;
      if (value!.isEmpty) {
        myErrorString = StringConstants.passwordEmpty;
        return myErrorString;
      } else if (value.length < 6) {
        myErrorString = StringConstants.validPassword;
        //validateMe();
        return myErrorString;
      }
      isError = false;
      myErrorString = "";
    } else {
      myErrorString = "";
    }
  }
}
