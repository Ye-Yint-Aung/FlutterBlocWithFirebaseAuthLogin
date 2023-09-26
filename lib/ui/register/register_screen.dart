import 'package:bloc_base/repository/auth_repo.dart';
import 'package:bloc_base/ui/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/Auth/auth_bloc.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailText = TextEditingController();

  TextEditingController passwordText = TextEditingController();
  TextEditingController confirmPasswordText = TextEditingController();

  //late String userName;
  late String email;
  late String password;
  late String confirmPassword;
  AuthRepo authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: double.infinity,
            color: Colors.lightBlueAccent,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(

                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthLoadingState) {
                      Center(child: CircularProgressIndicator());
                    } else if (state is AuthSuccessState) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else if (state is AuthErrorState) {
// print("Error State...........");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return  AlertDialog(
                              title: Text(
                                  state.errorMessage.toString()),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Retry"))
                              ],
                            );
                          });
                    }
                  },
                  child: Column(children: [
                    const Padding(
                      padding: const EdgeInsets.only(top: 150, bottom: 50),
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: emailText,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill email";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: passwordText,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill password";
                          } else if (value.length < 6) {
                            return "Please fill at least 6 character";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: confirmPasswordText,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please fill confirm password";
                          } else if (value != passwordText.text) {
                            return "Please fill same password";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white70,
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.amberAccent,
                        elevation: 20,
                        shadowColor: Colors.amber,
                      ),
                      onPressed: () async {
                        // userName = userNameText.text.toString();
                        if (!_formKey.currentState!.validate()) return;

                        email = emailText.text;
                        password = passwordText.text;
                        confirmPassword = confirmPasswordText.text;
                        context
                            .read<AuthBloc>()
                            .createUserInFireBase(email, password);
                      },
                      child: const Text("REGISTER NOW"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text("You have an account?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              child: const Text("Login Now"))
                        ],
                      ),
                    )
                  ]),
                ),
              ),
            )


        ),
      ),

    );
  }
}
