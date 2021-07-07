import 'package:firebase_login/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_login/utils/context_extensions.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: BlocBuilder<SignUpCubit, SignUpState>(
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: 'full name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      //onChanged: BlocProvider.of<SignUpCubit>(context).emailChanged,
                      decoration: InputDecoration(
                          labelText: 'email',
                          // errorText:!state.username.hasError ? 'invalid email' : null,
                          border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      obscureText: !state.isPasswordVisible,
                      onChanged:
                          BlocProvider.of<SignUpCubit>(context).passwordChanged,
                      decoration: InputDecoration(
                          labelText: 'password',
                          suffix: GestureDetector(
                            onTap: BlocProvider.of<SignUpCubit>(context)
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
