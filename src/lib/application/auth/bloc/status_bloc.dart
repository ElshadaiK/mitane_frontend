

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mitane_frontend/application/auth/events/status_events.dart';
import 'package:mitane_frontend/application/auth/states/status_state.dart';

class LoginStatusBloc extends Bloc<StatusEvent,StatusState>{
  LoginStatusBloc() : super(InitStatusState());

  @override
  Stream<StatusState> mapEventToState(StatusEvent event) async*{

    if(event is CheckStatus){
      final user = await userData();
      if(user.isEmpty){
        yield LoggedInState(userData: user);
      }
      else{
        yield LoggedOutState();
      }
    }
  }

  static Future<Map<String,dynamic>> userData() async{
    final storage = FlutterSecureStorage();

    String? token = await storage.read(key: 'token');
    String? name = await storage.read(key: 'name');
    String? phone = await storage.read(key: 'phone');
    String? role = await storage.read(key: 'role');
    String? password = await storage.read(key: 'password');
    return {'name':name,'token':token,'phone':phone,'role':role,'password':password};
  }
  
}