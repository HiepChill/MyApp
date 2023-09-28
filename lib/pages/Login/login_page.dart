import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/components/login_components/login_button.dart';
import 'package:food_app/components/login_components/logo.dart';
import 'package:food_app/components/login_components/my_textfield.dart';
import 'package:food_app/services/auth_services.dart';
import 'package:food_app/themes/const.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void signIn() async {
    //loading
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading
      Navigator.pop(context);

      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor_loginPage,
      body: SingleChildScrollView(
        child: Stack(children: [
          Align(
            alignment: const AlignmentDirectional(20, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.yellow),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(-3.6, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.65,
              width: MediaQuery.of(context).size.width / 1.25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.pink),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(3.6, -1.2),
            child: Container(
              height: MediaQuery.of(context).size.width / 1.65,
              width: MediaQuery.of(context).size.width / 1.25,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.purple),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 150.0, sigmaY: 150.0),
            child: Container(),
          ),
          SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/donut.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome back!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    MyTextFeild(
                      controller: emailController,
                      hintText: 'Email',
                      obscureText: false,
                      prefixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 15),
                    MyTextFeild(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      prefixIcon: const Icon(Icons.key),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    LnRButton(
                      text: 'Sign In',
                      onTap: signIn,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                          Text('Or continue with'),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(
                            imagePath: 'assets/images/google.png',
                            onTap: () => AuthServices().signInWithGoogle(),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Logo(
                            imagePath: 'assets/images/apple.png',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Not a member?'),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: widget.onTap,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
