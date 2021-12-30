import 'package:my_bloc_demo/repository/post_repository.dart';

class ApiInterface implements ApiInterfaceService {
  @override
  LoginRepositoryImpl getPostRepository() {
    return LoginRepositoryImpl();
  }
}
abstract class ApiInterfaceService {
  LoginRepositoryImpl getPostRepository();
}