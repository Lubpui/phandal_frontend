// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String errorMessage = '';

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
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
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: usernameController,
                  obscureText: !_isPasswordVisible,
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
                          color: errorMessage != ""
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
                    if (value!.isEmpty) {
                      return "Username cant be empty";
                    }
                    bool emailValid =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value);
                    if (!emailValid) {
                      return "Enter valid email";
                    }
                    return null;
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
                        color: errorMessage != ""
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
                          color: errorMessage != ""
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
                      errorMessage = error;
                    });

                    return errorMessage;
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
                      print("Success");
                      usernameController.clear();
                      passwordController.clear();
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
                            image: AssetImage('assets/google_icon.png'))),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 75,
                      width: 75,
                      child: const Image(
                          image: AssetImage(
                        'assets/facebook_icon.png',
                      )),
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
                        onTap: () {},
                        child: const Text(
                          "Register now",
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
