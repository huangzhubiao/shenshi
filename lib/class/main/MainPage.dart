import 'package:flutter/material.dart';
import 'package:shenshi/class/redux/loginstatus/LoginStatus.dart';
import '../rootTabar/RootTabarPage.dart';
import '../login/LoginPage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/MyState.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    LoginStatuManager loginStatuManager = new LoginStatuManager();
    loginStatuManager.setLoginStatus(1);
    
    return StoreBuilder<MyState>(
      builder: (context,store){
        LoginStatuManager loginStatusManager =store.state.loginStatusManager;
        if(loginStatusManager.getLoginStatus() == 0){
          isLogin = false;
        }else{
          isLogin = true;
        }

        return Scaffold(
          body: isLogin?RootTabarPage():LoginPage(),
        );
      },
    );

  }
}