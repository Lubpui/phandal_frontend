// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print, unnecessary_new, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/model/account_model.dart';
import 'package:phandal_frontend/model/response_body_model.dart';
import 'package:phandal_frontend/widget/custom_text_form_field.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/widget/flash_message_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();

  final username = TextEditingController();
  final email = TextEditingController();
  final birth = TextEditingController();
  final password = TextEditingController();

  ErrorAccount errorMessages = new ErrorAccount();
  ResponseBody responseBody = new ResponseBody();

  @override
  void initState() {
    super.initState();
    errorMessages.username = '';
    errorMessages.password = '';
    errorMessages.email = '';
    errorMessages.birth = '';
    errorMessages.conpassword = '';
    errorMessages.response = '';

    username.text = '';
    password.text = '';
    email.text = '';
    birth.text = '';
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    email.dispose();
    birth.dispose();
    super.dispose();
  }

  void register() async {
    try {
      if (_formkey.currentState!.validate()) {
        Map<String, String> body = {
          'username': username.text,
          'email': email.text,
          'birthdate': birth.text,
          'password': password.text,
        };

        var url =
            Uri.parse("https://phandal-backend.onrender.com/user/register");
        var res = await http.post(url, body: body);

        if (res.statusCode == 201) {
          print('Register successful...');

          username.clear();
          email.clear();
          birth.clear();
          password.clear();

          FlashMessageScreen.show(
            context,
            'You are registered successfully...',
            res.statusCode,
          );

          context.push(context.namedLocation('Login'));
        } else {
          setState(() {
            responseBody = responseBodyFromJson(res.body);
          });

          print('Status Error: ${responseBody.statusCode}');

          FlashMessageScreen.show(
            context,
            responseBody.message!,
            responseBody.statusCode!,
          );
        }
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                const Image(
                    image: AssetImage(
                  'assets/logo.png',
                )),
                CustomTextFormField(
                  hintText: 'Username',
                  controller: username,
                  errorMessages: errorMessages,
                  validator: (value) {
                    String error = '';
                    if (value!.isEmpty) {
                      error = "username can't be empty";
                    }

                    setState(() {
                      errorMessages.username = error;
                    });
                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: email,
                  errorMessages: errorMessages,
                  validator: (value) {
                    String error = '';
                    if (value!.isEmpty) {
                      error = "Email can't be empty";
                    } else if (!RegExp("^[a-zA-Z0-9+.-]+@[a-zA-Z0-9+.-]+.[a-z]")
                        .hasMatch(value)) {
                      error = "Enter your valid Email";
                    }
                    setState(() {
                      errorMessages.email = error;
                    });
                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Brithdate',
                  controller: birth,
                  errorMessages: errorMessages,
                  onTap: () {
                    setState(() {
                      _selectDate();
                    });
                  },
                  validator: (value) {
                    String error = '';
                    if (value!.isEmpty) {
                      error = "Brithdate can't be empty";
                    }

                    setState(() {
                      errorMessages.birth = error;
                    });
                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: password,
                  errorMessages: errorMessages,
                  isPassword: true,
                  validator: (value) {
                    String error = '';
                    if (value!.isEmpty) {
                      error = "Enter Password";
                    }
                    setState(() {
                      errorMessages.password = error;
                    });

                    return error != "" ? error : null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Confirm Password',
                  errorMessages: errorMessages,
                  isPassword: true,
                  validator: (value) {
                    String error = '';
                    if (value!.isEmpty) {
                      error = "Enter Password";
                    } else if (password.text != value) {
                      error = "Password don't match";
                    }
                    setState(() {
                      errorMessages.conpassword = error;
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
                    register();
                  },
                  child: const Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Color(0xFF253960),
                        fontSize: 20,
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
                        onTap: () {
                          context.push(context.namedLocation('Login'));
                        },
                        child: const Text(
                          "Login",
                          style:
                              TextStyle(color: Color(0xFF6BC7E9), fontSize: 14),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //DatePicker
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        birth.text = picked.toString().split(" ")[0];
      });
    }
  }
}
