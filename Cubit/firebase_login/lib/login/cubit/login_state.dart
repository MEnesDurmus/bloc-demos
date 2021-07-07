part of 'login_cubit.dart';

class LoginState {
  final FormStatus status;
  final Username username;
  final Password password;
  final bool isPasswordVisible;

  LoginState(
      {required this.status,
      required this.username,
      required this.password,
      required this.isPasswordVisible});

  LoginState.initialState()
      : status = FormStatus.pure(),
        username = Username.pure(),
        password = Password.pure(),
        isPasswordVisible = false;

  LoginState copyWith(
      {FormStatus? status,
      Username? username,
      Password? password,
      bool? isPasswordVisible}) {
    return LoginState(
        status: status ?? this.status,
        username:
            username ?? (status != null ? status.username : this.username),
        password: password ?? this.password,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible);
  }

  bool get isSignable => username.isValid && password.isValid;
}
