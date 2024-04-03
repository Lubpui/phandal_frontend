// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phandal_frontend/model/account_model.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();

  final username = TextEditingController();
  final email = TextEditingController();
  final birth = TextEditingController();
  final password = TextEditingController();

  Account errorMessage = new Account();

  bool _isPasswordVisible = false;
  bool _isConPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    errorMessage.username = '';
    errorMessage.password = '';
    errorMessage.email = '';
    errorMessage.birth = '';
    errorMessage.conpassword = '';

    username.text = '';
    password.text = '';
    email.text = '';
    birth.text = '';
    _isPasswordVisible = false;
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    email.dispose();
    birth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                const Image(image: AssetImage('assets/logo.png')),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Username",
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
                      error = "Enter your username";
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
                  controller: email,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Email",
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
                      error = "Enter your Email";
                    } else if (!RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9+.-]+.[a-z]")
                        .hasMatch(value)) {
                      error = "Enter your valid Email";
                    }
                    setState(() {
                      errorMessage.email = error;
                    });
                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: birth,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Brithdate",
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
                    } else if (value.length < 6 || value.length > 20) {
                      error =
                          "Username must be between 6 and 20 characters long";
                    }
                    setState(() {
                      errorMessage.birth = error;
                    });
                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
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
                    contentPadding: const EdgeInsets.only(left: 20),
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
                TextFormField(
                  obscureText: !_isConPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isConPasswordVisible = !_isConPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isConPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: errorMessage.conpassword != ""
                            ? Color(0xFFFF6767)
                            : Color(0xFF6BC7E9),
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintText: "Confirm Password",
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
                    } else if (password.text != value) {
                      error = "Passwords don't match";
                    }
                    setState(() {
                      errorMessage.conpassword = error;
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
                    if (_formkey.currentState!.validate()) {
                      String jsonString = jsonEncode({
                        'username': username.text,
                        'email': email.text,
                        'brith': birth.text,
                        'password': password.text,
                      });
                      print(jsonString);
                      username.clear();
                      email.clear();
                      birth.clear();
                      password.clear();
                    }
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
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Sigh Up",
                          style:
                              TextStyle(color: Color(0xFF6BC7E9), fontSize: 14),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
