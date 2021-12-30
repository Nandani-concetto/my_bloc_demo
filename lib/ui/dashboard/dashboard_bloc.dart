import 'dart:async';
import 'package:my_bloc_demo/di/app_component_base.dart';
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/ui/common/app_exception.dart';
import 'package:my_bloc_demo/ui/common/widgets/bloc_provider.dart';

class DashboardBloc extends BlocBase {
  final _postListStreamController = StreamController<Details?>();

  Stream<Details?> get postStream => _postListStreamController.stream;

  @override
  void initData() {
    fetchDetails("abc","xyz");
    super.initData();
  }

  @override
  void dispose() {
    _postListStreamController.close();
  }

  fetchDetails(String username,String password) {
    _postListStreamController.sink.add(null);
    AppComponentBase.getInstance()
        .getApiInterface()
        .getPostRepository()
        .getLogin(Details())
        .then((details) {
      _postListStreamController.sink.add(details);
    }).catchError((error) {
      _postListStreamController.sink.add(null);
      if (error is AppException) error.onException();
    });
  }
}
