abstract class AuthState{}


// login user state
class LoggingIn extends AuthState{}
class LoggedIn  extends AuthState{}
class LoggingError extends AuthState{}

// logut user state
class LoggedOut extends AuthState{}

// register user state
class Registering extends AuthState{}
class Registered extends  AuthState{}
class RegisterError extends AuthState{}

// forgot password
