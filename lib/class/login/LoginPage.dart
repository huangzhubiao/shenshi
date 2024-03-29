import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shenshi/class/redux/loginstatus/LoginStatus.dart';
import '../redux/MyState.dart';
import '../redux/LoginStatusRedux.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
   return StoreBuilder<MyState>(
      builder: (context,store){
        return Scaffold(
          body:Center(
            child:FlatButton(
              onPressed: (){
                LoginStatuManager loginStatuManager = new LoginStatuManager();
                loginStatuManager.setLoginStatus(1);
                store.dispatch(new RefreshThemeDataAction(loginStatuManager));
              },
              child: Text('登录'),
            ),
          ) ,
        );
      },
    );
  }
}