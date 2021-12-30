
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/services/post_services.dart';

abstract class LoginRepository {
  Future<Details> getLogin(Details details );
}

class LoginRepositoryImpl extends LoginRepository {
  final _postService = PostServices();

  @override
  Future<Details> getLogin(Details details) {
    // TODO: implement getPostList
   return  _postService.getLogin(details);
  }


}

