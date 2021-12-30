import 'package:flutter/material.dart';

abstract class AppException implements Exception {
  void onException({BuildContext context, Function onButtonClick});
}

class NoInternetException extends AppException {
  @override
  void onException({BuildContext? context, Function? onButtonClick}) {
    print("Please check your Internet Connection");
  }
}

class PostException extends AppException{
  @override
  void onException({BuildContext? context, Function? onButtonClick}) {
    print("Error while fetching all details");
  }

}
