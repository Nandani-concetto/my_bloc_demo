import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_bloc_demo/ui/common/routes.dart';
import 'package:my_bloc_demo/ui/common/widgets/app_theme.dart';
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
    return ScreenUtilInit(
      designSize: Size(414,736),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => AppTheme(
        child: MaterialApp(
            routes: Routes.baseRoutes,
            builder: (context, widget) {
              final _appTheme = AppTheme.of(context);
              return Stack(
                children: <Widget>[
                  StreamBuilder<bool>(
                      initialData: false,
                      stream:
                          AppComponentBase.getInstance().progressDialogStream,
                      builder: (context, snapshot) {
                        return IgnorePointer(
                            ignoring: snapshot.data!, child: widget);
                      }),
                ],
              );
            }),
      ),
    );
  }

  @override
  void dispose() {
    AppComponentBase.getInstance().dispose();
    super.dispose();
  }
}
