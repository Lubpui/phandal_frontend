import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/navbar_widget.dart';
import 'package:phandal_frontend/widget/user_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 120,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const UserButton(),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "General Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  AppPallete.buttongradient2,
                  AppPallete.buttongradient1
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppPallete.transparentColor,
                          elevation: 0,
                          backgroundColor: AppPallete.transparentColor),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppPallete.greyscalebg),
                              child: const Icon(
                                Icons.notifications_outlined,
                                color: AppPallete.greyscaleicon,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Notification",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 151, 151, 151)),
                                ),
                                Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppPallete.greyscalebg,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppPallete.transparentColor,
                          elevation: 0,
                          backgroundColor: AppPallete.transparentColor),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppPallete.greyscalebg),
                              child: const Icon(
                                Icons.language,
                                color: AppPallete.greyscaleicon,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Language",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 151, 151, 151)),
                                ),
                                Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppPallete.greyscalebg,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: AppPallete.transparentColor,
                          elevation: 0,
                          backgroundColor: AppPallete.transparentColor),
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppPallete.greyscalebg),
                              child: const Icon(
                                Icons.error_outline_outlined,
                                color: AppPallete.greyscaleicon,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          Color.fromARGB(255, 151, 151, 151)),
                                ),
                                Text(
                                  "Coming soon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppPallete.greyscalebg,
                                      fontSize: 16),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
