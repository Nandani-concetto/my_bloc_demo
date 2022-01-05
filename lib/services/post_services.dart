import 'dart:convert';

import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/models/user_request.dart';
import 'package:my_bloc_demo/ui/common/api_client.dart';
import 'package:my_bloc_demo/ui/common/app_exception.dart';

class PostServices extends ApiClient {
  Future<Details> getLogin(UserRequest userRequest) async {
    try{
      String body = jsonEncode(userRequest.toJson());
      final response = await post(baseUrl, body: body);
      print(response.body);
      final responseHandler=Details.fromJson(json.decode(response.body));
      if (response.statusCode == successResponse && responseHandler.isSuccess) {
        print(response);
        return responseHandler;
      } else {
        throw PostException(responseHandler.message!);
      }
    }
    catch(e,s){
      print(s);
      throw e;
    }
  }
}
