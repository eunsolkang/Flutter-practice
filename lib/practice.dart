import 'package:flutter/material.dart';
import './Layout.dart';
import './returnArguments.dart';
import './PassArguments.dart';
import './route.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.red),
      home: MainScreen(),

      routes: {
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen()
      },

      // initialRoute: '/',

      // routes: {
      //   '/': (context) => FirstRoute(),
      //   '/second': (context) => SecondRoute(),
      //  },

      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == PassArgumentsScreen.routeName) {
          final ScreenArguments args = routeSettings.arguments;

          return MaterialPageRoute(builder: (context) {
            return PassArgumentsScreen(
              title: args.title,
              message: args.message,
            );
          });
        }
      },
    );
  }
}

// 화면에서 데이터 반환받기
