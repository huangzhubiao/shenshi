import 'package:flutter/material.dart';
import 'package:shenshi/class/redux/loginstatus/LoginStatus.dart';
import './class/main/MainPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './class/redux/MyState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final store = new Store<MyState>(
    appReducer,
    initialState: new MyState(
      loginStatusManager: new LoginStatuManager(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new MainPage(),
      ),
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MainPage(),
    // );
  }
}

