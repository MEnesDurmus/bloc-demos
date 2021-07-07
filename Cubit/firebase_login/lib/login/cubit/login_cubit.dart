import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/login/models/models.dart';
import 'package:flutter/material.dart';
import 'package:firebase_login/utils/context_extensions.dart';

part 'login_state.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initialState());

  void emailChanged(String email) {
    emit(state.copyWith(
        status: FormStatus.copyWith(state.status,
            username: Username.fromValue(email)),
        username: Username.fromValue(email)));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(
        status: FormStatus.copyWith(state.status,
            password: Password.fromValue(password)),
        password: Password.fromValue(password)));
  }

  void signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: state.username.value, //'enes@gmail.com',
          password: state.password.value //'12345678'
          );

      emit(state.copyWith(
          status: FormStatus.copyWith(state.status,
              isSignable: false, isSignedIn: true)));

      context.showSnackBar('${userCredential.user!.email} has signed in!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        context.showSnackBar('No user found for that email.');
        emit(state.copyWith(
            status: FormStatus.copyWith(state.status,
                isSignable: false, isSignedIn: true)));
      } else if (e.code == 'wrong-password') {
        context.showSnackBar('Wrong password provided for that user.');
      }
    }
  }

  void signOut(BuildContext context) async {
    final User? user = auth.currentUser;
    if (user == null) {
      context.showSnackBar('No one has signed in.');
      return;
    }
    await auth.signOut();

    final String email = user.email ?? 'null';
    context.showSnackBar('$email has successfully signed out.');
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
