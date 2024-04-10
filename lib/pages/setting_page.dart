import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/user_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: AppPallete.searchbarcolor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                autofocus: false,
                // onChanged: (value) => updateList(value),
                style: const TextStyle(
                  color: AppPallete.whiteColor,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: Color(0xff5B7299),
                    ),
                  ),
                  hintText: "Search Settings, etc",
                  hintStyle: const TextStyle(color: Color(0xff496BA5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const UserButton(),
            const SizedBox(height: 20),
            const Text(
              "General Settings",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: Container(
                height: 350,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppPallete.greyscalebg),
                                child: const Icon(
                                  Icons.notifications_outlined,
                                  color: AppPallete.greyscaleicon,
                                  size: 35,
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
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppPallete.greyscalebg),
                                child: const Icon(
                                  Icons.palette_outlined,
                                  color: AppPallete.greyscaleicon,
                                  size: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Appearance",
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
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppPallete.greyscalebg),
                                child: const Icon(
                                  Icons.language_outlined,
                                  color: AppPallete.greyscaleicon,
                                  size: 35,
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
                                width: 54,
                                height: 54,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppPallete.greyscalebg),
                                child: const Icon(
                                  Icons.error_outline_outlined,
                                  color: AppPallete.greyscaleicon,
                                  size: 35,
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
      ),
    );
  }
}
