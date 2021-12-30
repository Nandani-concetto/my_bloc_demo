import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_bloc_demo/di/app_component_base.dart';
import 'package:my_bloc_demo/models/post.dart';
import 'package:my_bloc_demo/models/user_request.dart';
import 'package:my_bloc_demo/ui/common/app_exception.dart';
import 'package:my_bloc_demo/ui/common/routes.dart';
import 'package:my_bloc_demo/ui/common/widgets/bloc_provider.dart';
import 'package:my_bloc_demo/ui/profile_page/profile_page.dart';

class DashboardBloc extends BlocBase {
  final _postListStreamController = StreamController<Details?>();

  Stream<Details?> get postStream => _postListStreamController.stream;

  @override
  void initData() {
    super.initData();
  }

  @override
  void dispose() {
    _postListStreamController.close();
  }

  fetchDetails(String username,String password, BuildContext context) {
    _postListStreamController.sink.add(null);
    AppComponentBase.getInstance()
        .getApiInterface()
        .getPostRepository()
        .getLogin(UserRequest(
      username: username,
      password: password,
      deviceId: "fugvk9qw2vk:apa91bg5duiltd0e-nt5yqknuocuymtqdkgugv5ylx74-arlhpliekbm-zfio3l7ntbihtttvitm5dc6hc2bwgea-tylqamvjw4jthubyl9jikphfskcsgrlr6266voo1hexcq6y821m",
      deviceType:  "1",

    ))
        .then((details) {
      _postListStreamController.sink.add(details);
      print(username);
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfilePage(username: username)));
    }).catchError((error) {
      _postListStreamController.sink.addError(error);
      if (error is PostException) {
        print(error.message);
        displayDialog(context,error.message);

      }
      print("Error is $error");
    });
  }
}
displayDialog(BuildContext context,String message) async {
  await showDialog(
      context: context,
      builder:(BuildContext context){
        return SimpleDialog(
          title: Text('Welcome'),
          children:[
            SimpleDialogOption(
              child:  Text(message,
                style: TextStyle(
                    fontSize:15
                ),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child:Padding(
                padding: const EdgeInsets.only(left:210),
                child: Text("OK"),
              ),
            ),
          ],
          // elevation: 10,
        );
      }
  );
}
