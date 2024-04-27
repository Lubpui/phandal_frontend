import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/history_model.dart';
import 'package:phandal_frontend/model/score_model.dart';
import 'package:phandal_frontend/widget/user_data.dart';

HistoryModel mockUpHistory = HistoryModel(
  match: [
    Match(
      redTeam: Team(
        userId: '123',
        score: Score(
          killed: 0,
          death: 1,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Lose',
      ),
      blueTeam: Team(
        userId: '124',
        score: Score(
          killed: 1,
          death: 0,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Win',
      ),
    ),
    Match(
      redTeam: Team(
        userId: '123',
        score: Score(
          killed: 0,
          death: 1,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Lose',
      ),
      blueTeam: Team(
        userId: '124',
        score: Score(
          killed: 1,
          death: 0,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Win',
      ),
    ),
    Match(
      redTeam: Team(
        userId: '123',
        score: Score(
          killed: 0,
          death: 1,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Win',
      ),
      blueTeam: Team(
        userId: '124',
        score: Score(
          killed: 1,
          death: 0,
          acc: 10,
          hit: 5,
          short: 66,
        ),
        competitionResults: 'Lose',
      ),
    )
  ],
  summaryScore: Score(
    killed: 13,
    death: 2,
    acc: 50.45,
    hit: 11,
    short: 20,
    winCount: 60,
    loseCount: 50,
  ),
);

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Stats",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [
                            AppPallete.buttongradient2,
                            AppPallete.buttongradient1,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                                      fontSize: 20,
                                      color: AppPallete.whiteColor),
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
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                          colors: [
                            AppPallete.buttongradient2,
                            AppPallete.buttongradient1,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
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
      ),
    );
  }
}
