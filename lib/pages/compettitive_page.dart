// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unnecessary_new, unnecessary_null_comparison, avoid_print, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps, unnecessary_this, avoid_function_literals_in_foreach_calls, unnecessary_string_interpolations

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/history_model.dart';
import 'package:phandal_frontend/model/player_info.dart';
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
  final String address;

  const CompPage({super.key, required this.address});

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
  String res = '0';

  BluetoothConnection? connection;

  bool isConnecting = true;
  bool get isConnected => (connection?.isConnected ?? false);
  bool isDisconnecting = false;

  @override
  void initState() {
    super.initState();

    if (mockUpincomeTeam.team == 'red') {
      redTeam = mockUpincomeTeam;
    }

    if (mockUpincomeTeam.team == 'blue') {
      blueTeam = mockUpincomeTeam;
    }

    final userState = BlocProvider.of<UserBloc>(context).state;

    if (userState.user != null) {
      try {
        BluetoothConnection.toAddress(widget.address).then((_connection) {
          print('Connected to the device ${widget.address}');
          connection = _connection;
          setState(() {
            isConnecting = false;
            isDisconnecting = false;
          });

          connection?.input!.listen(_onDataReceived).onDone(() {
            if (isDisconnecting) {
              print('Disconnecting locally!');
            } else {
              print('Disconnected remotely!');
            }
            if (this.mounted) {
              setState(() {});
            }
          });
        }).catchError((error) {
          print('Cannot connect, exception occured');
          print(error);
        });
      } catch (err) {
        print('Cannot connect to device $err, exception occured');
      }
    }
  }

  void _onDataReceived(Uint8List data) {
    int backspacesCounter = 0;
    data.forEach((byte) {
      if (byte == 8 || byte == 127) {
        backspacesCounter++;
      }
    });
    Uint8List buffer = Uint8List(data.length - backspacesCounter);
    int bufferIndex = buffer.length;

    backspacesCounter = 0;
    for (int i = data.length - 1; i >= 0; i--) {
      if (data[i] == 8 || data[i] == 127) {
        backspacesCounter++;
      } else {
        if (backspacesCounter > 0) {
          backspacesCounter--;
        } else {
          buffer[--bufferIndex] = data[i];
        }
      }
    }

    String dataString = String.fromCharCodes(buffer);

    setState(() {
      res = dataString;
    });

    PlayerInfo playerInfo = playerInfoFromJson(dataString);

    final userState = BlocProvider.of<UserBloc>(context).state;
    if (redTeam.user.id == userState.user?.id) {
      setState(() {
        if (playerInfo.short != null) {
          redTeam.score.short = playerInfo.short!;
        }

        if (playerInfo.hp != null) {
          redTeam.health = playerInfo.hp;
        }
      });
    }

    if (blueTeam.user.id == userState.user?.id) {
      setState(() {
        if (playerInfo.short != null) {
          blueTeam.score.short = playerInfo.short!;
        }

        if (playerInfo.hp != null) {
          blueTeam.health = playerInfo.hp;
        }
      });
    }
  }

  @override
  void dispose() {
    if (isConnected) {
      isDisconnecting = true;
      connection?.dispose();
      connection = null;
    }

    super.dispose();
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
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return Text(
                      '${widget.address} | $res',
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
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, stateUser) {
                          return IconButton(
                            onPressed: () {
                              if (stateUser.user == null) return;

                              setState(() {
                                redTeam = Team(
                                  user: UserLite(
                                    id: stateUser.user!.id,
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
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (context, stateUser) {
                          return IconButton(
                            onPressed: () {
                              if (stateUser.user == null) return;

                              setState(() {
                                blueTeam = Team(
                                  user: UserLite(
                                    id: stateUser.user!.id,
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
