import 'package:bloc/bloc.dart';
import 'package:firebase_login/login/models/models.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initialState());

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

  void fullNameChanged(String fullName) {
    emit(state.copyWith(fullName: fullName));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }
}
