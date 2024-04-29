// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, unnecessary_null_comparison, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phandal_frontend/bloc/auth/auth_bloc.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/history_model.dart';
import 'package:phandal_frontend/model/score_model.dart';
import 'package:phandal_frontend/model/userDB.dart';
import 'package:phandal_frontend/model/user_lite_model.dart';
import 'package:phandal_frontend/utils/utils.dart';
import 'package:phandal_frontend/widget/user_data.dart';

Team mockUpincomeTeam = Team(
  user: UserLite(
    id: '662c2413822dbaba44e1c97f',
    image:
        'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b1442942874313.57dac110b1a6c.jpg',
    username: 'Bot1',
  ),
  score: Score(killed: 0, death: 0, short: 0),
  team: 'blue',
  health: 100,
  competitionResult: '',
);

class CompPage extends StatefulWidget {
  const CompPage({super.key});

  @override
  State<CompPage> createState() => _CompPageState();
}

final UserModel selectedUser = UserModelDB.modelDB[0];

class _CompPageState extends State<CompPage> {
  Team redTeam = Team(
    user: UserLite(id: '', username: '', image: ''),
    score: Score(killed: 0, death: 0, short: 0),
    team: '',
    health: 100,
    competitionResult: '',
  );

  Team blueTeam = Team(
    user: UserLite(id: '', username: '', image: ''),
    score: Score(killed: 0, death: 0, short: 0),
    team: '',
    health: 100,
    competitionResult: '',
  );

  @override
  void initState() {
    super.initState();

    if (mockUpincomeTeam.team == 'red') {
      redTeam = mockUpincomeTeam;
    }

    if (mockUpincomeTeam.team == 'blue') {
      blueTeam = mockUpincomeTeam;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Text("Code : "),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return Text(
                      state.userId,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
            redTeam.user.id.isNotEmpty
                ? _buildPlayerInfo(redTeam)
                : Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.cyan)),
                    child: Center(
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, stateAuth) {
                          return BlocBuilder<UserBloc, UserState>(
                            builder: (context, stateUser) {
                              return IconButton(
                                onPressed: () {
                                  if (stateUser.user == null) return;

                                  setState(() {
                                    redTeam = Team(
                                      user: UserLite(
                                        id: stateAuth.userId,
                                        username: stateUser.user!.username,
                                        image: stateUser.user!.image,
                                      ),
                                      score: Score(
                                        killed: 0,
                                        death: 0,
                                        short: 0,
                                      ),
                                      health: 100,
                                      team: 'red',
                                      competitionResult: '',
                                    );
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 50,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
            ElevatedButton(
              onPressed: () {
                Map<String, dynamic> boby = {
                  'redTeam': redTeam.toJson(),
                  'blueTeam': blueTeam.toJson()
                };

                print(boby);
              },
              child: Text(
                "Start",
                style: TextStyle(color: AppPallete.batterycolor, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppPallete.buttongradient1),
            ),
            blueTeam.user.id.isNotEmpty
                ? _buildPlayerInfo(blueTeam)
                : Container(
                    height: 220,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1, color: Colors.cyan)),
                    child: Center(
                      child: BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, stateAuth) {
                          return BlocBuilder<UserBloc, UserState>(
                            builder: (context, stateUser) {
                              return IconButton(
                                onPressed: () {
                                  if (stateUser.user == null) return;

                                  setState(() {
                                    blueTeam = Team(
                                      user: UserLite(
                                        id: stateAuth.userId,
                                        username: stateUser.user!.username,
                                        image: stateUser.user!.image,
                                      ),
                                      score: Score(
                                        killed: 0,
                                        death: 0,
                                        short: 0,
                                      ),
                                      health: 100,
                                      team: 'blue',
                                      competitionResult: '',
                                    );
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 50,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInfo(Team player) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              colors: [AppPallete.buttongradient2, AppPallete.buttongradient1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          return CircleAvatar(
                            backgroundImage: NetworkImage(player.user.image),
                          );
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            player.user.username,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "Team : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                player.team,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: player.team == 'red'
                                      ? Colors.red
                                      : player.team == 'blue'
                                          ? Colors.blueAccent
                                          : null,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Shot",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        player.score.short.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: LinearPercentIndicator(
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: player.health != null ? (player.health! / 100) : 0,
                center: Text("${player.health}%"),
                progressColor: Color(toIntColor('#34D399')),
                barRadius: const Radius.circular(20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Kill",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        player.score.killed.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.win),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Death",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        player.score.death.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppPallete.lost),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
