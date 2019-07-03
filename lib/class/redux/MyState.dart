import 'LoginStatusRedux.dart';
import './loginstatus/LoginStatus.dart';

class MyState {
  
  LoginStatuManager loginStatusManager;

  MyState({this.loginStatusManager});

}

MyState appReducer(MyState state,action){
  return MyState(
    loginStatusManager: LoginStatusReducer(state.loginStatusManager,action),
  );
}