import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isPassword = true;
  bool isconPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: SizedBox(
                height: 150,
                child: Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF253960),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "username",
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff6BC7E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF253960),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "email",
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff6BC7E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF253960),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "birthdate",
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff6BC7E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF253960),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  obscureText: isPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                          isPassword ? Icons.visibility : Icons.visibility_off),
                      color: const Color(0xff6BC7E9),
                      onPressed: () {
                        isPassword = !isPassword;
                        setState(() {});
                      },
                    ),
                    hintText: "password",
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff6BC7E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF253960),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextFormField(
                  obscureText: isconPassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(isconPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      color: const Color(0xff6BC7E9),
                      onPressed: () {
                        isconPassword = !isconPassword;
                        setState(() {});
                      },
                    ),
                    hintText: "confirm password",
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff6BC7E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xff6BC7E9),
                  ),
                  child: const Center(
                    child: Text(
                      "Sigh Up",
                      style: TextStyle(
                        color: Color(0xff1E345C),
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
