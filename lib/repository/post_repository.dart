
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/models/user_request.dart';
import 'package:my_bloc_demo/services/post_services.dart';

abstract class LoginRepository {
  Future<Details> getLogin(UserRequest userRequest );
}

class LoginRepositoryImpl extends LoginRepository {
  final _postService = PostServices();

  @override
  Future<Details> getLogin(UserRequest userRequest) {

   return  _postService.getLogin(userRequest);
  }


}

