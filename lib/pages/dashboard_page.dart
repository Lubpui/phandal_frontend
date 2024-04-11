import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  ),
);

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
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
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Wins",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green),
                          ),
                          Text(
                            "Kills",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "Deaths",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("42", style: TextStyle(fontSize: 20)),
                          Text("${mockUpHistory.summaryScore.killed}",
                              style: const TextStyle(fontSize: 20)),
                          Text("${mockUpHistory.summaryScore.death}",
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lose",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.red),
                          ),
                          Text(
                            "K/D",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ACC",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("12", style: TextStyle(fontSize: 20)),
                          Text("${mockUpHistory.summaryScore.hit}",
                              style: const TextStyle(fontSize: 20)),
                          Text("${mockUpHistory.summaryScore.short} %",
                              style: const TextStyle(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: mockUpHistory.match.length,
                  itemBuilder: (context, index) {
                    String redTeamResult =
                        mockUpHistory.match[index].redTeam.competitionResults;
                    String blueTeamResult =
                        mockUpHistory.match[index].blueTeam.competitionResults;
                    return Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppPallete.gradientUI1,
                            AppPallete.gradientUI2
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              redTeamResult,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: redTeamResult == 'Win'
                                    ? AppPallete.win
                                    : AppPallete.lost,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            ":",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              blueTeamResult,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: blueTeamResult == 'Win'
                                    ? AppPallete.win
                                    : AppPallete.lost,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
