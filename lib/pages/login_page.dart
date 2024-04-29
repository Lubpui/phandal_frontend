// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, use_build_context_synchronously, unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/bloc/auth/auth_bloc.dart';
import 'package:phandal_frontend/model/account_model.dart';
import 'package:phandal_frontend/model/login_model.dart';
import 'package:phandal_frontend/model/response_body_model.dart';
import 'package:phandal_frontend/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Account errorMessage = new Account();
  ResponseBody responseBody = new ResponseBody();

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    errorMessage.username = '';
    errorMessage.password = '';
    usernameController.text = '';
    passwordController.text = '';
    _isPasswordVisible = false;
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleClickSignIn() {
    if (_formkey.currentState!.validate()) {
      final loginPayload = LoginModel(
        password: passwordController.text,
        email: usernameController.text,
      );

      context.read<AuthBloc>().add(AuthEventLogin(loginPayload));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                'Version: Beta 1.0.1',
                style: TextStyle(
                    color: Color(
                      toIntColor('#3E4F70'),
                    ),
                    fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formkey,
                child: ListView(
                  children: [
                    const Image(image: AssetImage('assets/logo.png')),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 50, maxHeight: 50),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: errorMessage.username != ""
                                  ? Color(0xFFFF6767)
                                  : Color(0xFF6BC7E9),
                            ),
                            child: const Icon(
                              Icons.mail_outline_rounded,
                              color: Color(0xFF253960),
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 60),
                        hintText: "Username , email",
                        filled: true,
                        fillColor: Color(0xFF253960),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xFF6BC7E9),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xFFFF6767),
                          ),
                        ),
                      ),
                      validator: (value) {
                        String error = '';
                        if (value!.isEmpty) {
                          error = "Username can't be empty";
                        }

                        setState(() {
                          errorMessage.username = error;
                        });

                        return error != "" ? error : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        prefixIconConstraints:
                            const BoxConstraints(minWidth: 50, maxHeight: 50),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: errorMessage.password != ""
                                ? Color(0xFFFF6767)
                                : Color(0xFF6BC7E9),
                          ),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: errorMessage.password != ""
                                  ? Color(0xFFFF6767)
                                  : Color(0xFF6BC7E9),
                            ),
                            child: const Icon(
                              Icons.lock_outlined,
                              color: Color(0xFF253960),
                            ),
                          ),
                        ),
                        contentPadding: const EdgeInsets.only(left: 60),
                        hintText: "Password",
                        filled: true,
                        fillColor: Color(0xFF253960),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xFF6BC7E9),
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Color(0xFFFF6767),
                          ),
                        ),
                      ),
                      validator: (value) {
                        String error = '';
                        if (value!.isEmpty) {
                          error = "Enter Password";
                        } else if (passwordController.text.length < 6) {
                          error = "Password Lenght blyat!!";
                        }

                        setState(() {
                          errorMessage.password = error;
                        });

                        return error != "" ? error : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Color(0xFF6BC7E9))),
                      onPressed: () {
                        _handleClickSignIn();
                      },
                      child: const Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(
                            color: Color(0xFF253960),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Divider(
                            color: Color(0xFF6BC7E9),
                          ),
                        )),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "OR",
                          style: TextStyle(color: Color(0xFF6BC7E9)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.only(right: 40.0),
                          child: Divider(
                            color: Color(0xFF6BC7E9),
                          ),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          child: const Image(
                            image: AssetImage('assets/google_icon.png'),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          height: 75,
                          width: 75,
                          child: const Image(
                            image: AssetImage(
                              'assets/facebook_icon.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Not a member?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              context.push(context.namedLocation('Register'));
                            },
                            child: const Text(
                              "Register now",
                              style: TextStyle(
                                  color: Color(0xFF6BC7E9), fontSize: 14),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
