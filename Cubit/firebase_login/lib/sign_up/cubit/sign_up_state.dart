part of 'sign_up_cubit.dart';

class SignUpState {
  final FormStatus status;
  final String fullName;
  final Username username;
  final Password password;
  final bool isPasswordVisible;

  SignUpState(
      {required this.status,
      required this.fullName,
      required this.username,
      required this.password,
      required this.isPasswordVisible});

  SignUpState.initialState()
      : status = FormStatus.pure(),
        fullName = '',
        username = Username.pure(),
        password = Password.pure(),
        isPasswordVisible = false;

  SignUpState copyWith(
      {FormStatus? status,
      String? fullName,
      Username? username,
      Password? password,
      bool? isPasswordVisible}) {
    return SignUpState(
        status: status ?? this.status,
        fullName: fullName ?? this.fullName,
        username:
            username ?? (status != null ? status.username : this.username),
        password: password ?? this.password,
        isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible);
  }

  bool get isSignable => username.isValid && password.isValid;
}
