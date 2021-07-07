import 'package:firebase_login/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_login/utils/context_extensions.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: [
          GestureDetector(
              onTap: () =>
                  BlocProvider.of<LoginCubit>(context).signOut(context),
              child: Icon(Icons.logout)),
          SizedBox(width: 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: context.getHeight / 6,
                      width: context.getHeight / 6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png'),
                      )),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged:
                          BlocProvider.of<LoginCubit>(context).emailChanged,
                      decoration: InputDecoration(
                          labelText: 'email',
                          errorText:
                              !state.username.hasError ? 'invalid email' : null,
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: !state.isPasswordVisible,
                      onChanged:
                          BlocProvider.of<LoginCubit>(context).passwordChanged,
                      decoration: InputDecoration(
                          labelText: 'password',
                          suffix: GestureDetector(
                            onTap: BlocProvider.of<LoginCubit>(context)
                                .togglePasswordVisibility,
                            child: Icon(
                              state.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,
                            ),
                          ),
                          errorText: !state.password.hasError
                              ? 'invalid password'
                              : null,
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: state.status.isSignable
                          ? () {
                              BlocProvider.of<LoginCubit>(context)
                                  .signIn(context);
                            }
                          : null,
                      child: Text('SIGN IN'),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/signUp'),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Color(0xFF00BCD4),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
