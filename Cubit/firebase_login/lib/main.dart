import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/login/cubit/login_cubit.dart';
import 'package:firebase_login/login/login_page.dart';
import 'package:firebase_login/sign_up/cubit/sign_up_cubit.dart';
import 'package:firebase_login/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => BlocProvider(
              create: (context) => LoginCubit(),
              child: LoginPage(),
            ),
        '/signUp': (context) => BlocProvider(
              create: (context) => SignUpCubit(),
              child: SignUpPage(),
            )
      },
    );
  }
}
