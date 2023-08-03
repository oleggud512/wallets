class LoginFormError implements Exception { }

class LoginFormEmailError extends LoginFormError { }
class LoginFormPasswordError extends LoginFormError { }

class LoginFormIncorrectEmailError extends LoginFormEmailError { }
class LoginFormEmailNotFountError extends LoginFormEmailError { }
class LoginFormIncorrectPasswordError extends LoginFormPasswordError { }
class LoginFormPasswordsDontMatchError extends LoginFormPasswordError { }