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
  // Future<Details> getLogin(String username, String password) async {
  //   Map request = {
  //     "device_id":
  //         "fugvk9qw2vk:apa91bg5duiltd0e-nt5yqknuocuymtqdkgugv5ylx74-arlhpliekbm-zfio3l7ntbihtttvitm5dc6hc2bwgea-tylqamvjw4jthubyl9jikphfskcsgrlr6266voo1hexcq6y821m",
  //     "device_type": "1",
  //     "latitude": 0.0,
  //     "longitude": 0.0,
  //     'username': username,
  //     'password': password,
  //   };
  //
  //   final response = await post(
  //     baseUrl,
  //     headers: {},
  //     body: jsonEncode(request),
  //   );
  //   print(baseUrl);
  //
  //   print(jsonEncode(request));
  //
  //
  //   if (response.statusCode == successResponse) {
  //     print(response.body);
  //     try {
  //       return Details.fromJson(jsonDecode(response.body));
  //     } catch (exception) {
  //       throw Exception(exception.toString());
  //     }
  //   } else {
  //     throw PostException();
  //   }
  // }
}
