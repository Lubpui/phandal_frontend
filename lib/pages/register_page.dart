import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/logo.png'),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 40, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPallete.searchbarcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "username",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPallete.searchbarcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "email",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPallete.searchbarcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "birthdate",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPallete.searchbarcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: AppPallete.win,
                            ),
                            hintText: "password",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 40, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPallete.searchbarcolor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.remove_red_eye,
                              color: AppPallete.win,
                            ),
                            hintText: "confirm password",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 40, right: 40),
                child: TextButton(
                  style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF6BC7E9))),
                  onPressed: () {},
                  child: const Center(
                      child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Color(0xFF253960),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have account ?",
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      child: const Text(
                    "Login now",
                    style: TextStyle(
                        fontSize: 14, color: AppPallete.subtitlecolor),
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
