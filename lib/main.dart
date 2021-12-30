import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bloc_demo/ui/common/routes.dart';
import 'package:my_bloc_demo/ui/common/strings.dart';
import 'package:my_bloc_demo/ui/common/utils.dart';
import 'package:my_bloc_demo/ui/common/widgets/app_theme.dart';
import 'package:my_bloc_demo/ui/common/widgets/custom_progress_dialog.dart';

import 'di/app_component_base.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AppComponentBase.getInstance().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
          routes: Routes.baseRoutes,
          // builder: (context, widget) {
          //   final _appTheme = AppTheme.of(context);
          //   // ScreenUtil.init(context,
          //   //     width: _appTheme.expectedDeviceWidth,
          //   //     height: _appTheme.expectedDeviceHeight,
          //   //     allowFontScaling: false);
          //   return Stack(
          //     children: <Widget>[
          //       StreamBuilder<Object>(
          //           initialData: false,
          //           stream: AppComponentBase.getInstance().progressDialogStream,
          //           builder: (context, snapshot) {
          //             return IgnorePointer(
          //                 ignoring: snapshot.data!=null, child: widget);
          //           }),
          //       // StreamBuilder<bool>(
          //       //     initialData: true,
          //       //     stream: AppComponentBase.getInstance()
          //       //         .getNetworkManager()
          //       //         .internetConnectionStream,
          //       //     builder: (context, snapshot) {
          //       //       return SafeArea(
          //       //         child: AnimatedContainer(
          //       //             height: snapshot.data!=null
          //       //                 ? _appTheme.getResponsiveHeight(100)
          //       //                 : 0,
          //       //             duration: Utils.animationDuration,
          //       //             color: _appTheme.redColor,
          //       //             child: Material(
          //       //               type: MaterialType.transparency,
          //       //               child: Center(
          //       //                   child: Text(
          //       //                       StringConstants.noInternetConnection,
          //       //                       style: _appTheme.noInternetTextStyle)),
          //       //             )),
          //       //       );
          //       //     }),
          //       StreamBuilder<bool>(
          //           initialData: false,
          //           stream: AppComponentBase.getInstance().progressDialogStream,
          //           builder: (context, snapshot) {
          //             return snapshot.data!=null
          //                 ? Center(child: CustomProgressDialog())
          //                 : Offstage();
          //           })
          //     ],
          //   );
          // }
          ),
    );
  }

  @override
  void dispose() {
    AppComponentBase.getInstance().dispose();
    super.dispose();
  }
}
