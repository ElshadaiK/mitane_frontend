abstract class StatusState{}

class InitStatusState extends StatusState{}

class LoggedInState extends StatusState{
  final Map<String,dynamic> userData;
  LoggedInState({required this.userData});
}

class LoggedOutState extends StatusState{}