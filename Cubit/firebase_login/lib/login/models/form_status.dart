import 'package:firebase_login/login/models/models.dart';

class FormStatus {
  final Username username;
  final Password password;
  final bool isSignedIn;
  final bool isSignable;

  FormStatus(
      {required this.username,
      required this.password,
      required this.isSignedIn,
      this.isSignable = false});

  FormStatus.pure()
      : username = Username.pure(),
        password = Password.pure(),
        isSignedIn = false,
        isSignable = false;

  factory FormStatus.copyWith(FormStatus status,
      {Username? username,
      Password? password,
      bool? isSignedIn,
      bool? isSignable}) {
    return FormStatus(
        username: username ?? status.username,
        password: password ?? status.password,
        isSignedIn: isSignedIn ?? status.isSignedIn,
        isSignable: isSignable ??
            (username != null ? username.isValid : status.username.isValid) &&
                (password != null
                    ? password.isValid
                    : status.password.isValid));
  }
}
