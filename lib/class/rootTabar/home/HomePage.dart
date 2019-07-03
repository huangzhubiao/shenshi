import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:shenshi/class/redux/loginstatus/LoginStatus.dart';
import '../../redux/MyState.dart';
import '../../redux/LoginStatusRedux.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MyState>(
      builder: (context,store){
        return Scaffold(
          body:Center(
            child:FlatButton(
              onPressed: (){
                LoginStatuManager loginStatuManager = new LoginStatuManager();
                loginStatuManager.setLoginStatus(0);
                store.dispatch(new RefreshThemeDataAction(loginStatuManager));
              },
              child: Text('退出登录'),
            ),
          ) ,
        );
      },
    );
    
  }
}