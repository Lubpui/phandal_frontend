import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/navbar_widget.dart';
import 'package:phandal_frontend/widget/user_data.dart';

import '../model/usermodel.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});

  final List<Usermodel> modelDB = [
    Usermodel(
      name: "PatcharaPN",
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_CCRvW0Z7s0SH-1TFYoKxDg5P6A34J6XsyqUJEk4XYQ&s',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(90), child: UserData()),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Stats",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 305,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      AppPallete.buttongradient2,
                      AppPallete.buttongradient1,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Wins",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FF57)),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                "null",
                                style: TextStyle(
                                    fontSize: 20, color: AppPallete.whiteColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 305,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(colors: [
                      AppPallete.buttongradient2,
                      AppPallete.buttongradient1,
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "WIN",
                        style: TextStyle(
                            color: AppPallete.win,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Lost",
                        style: TextStyle(
                            color: AppPallete.lost,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
