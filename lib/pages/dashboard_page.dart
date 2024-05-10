// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phandal_frontend/bloc/history/history_bloc.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/history_model.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(HistoryEventGetHistory());

    super.initState();
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
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state.user == null) return Container();

                  return Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Wins',
                                          style: TextStyle(
                                            color: Colors.green[400],
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.winCount}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Killeds',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.killed}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Shorts',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.short}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text('Loses',
                                            style: TextStyle(
                                              color: Colors.red[400],
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.loseCount}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Deaths',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.death}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Shorts',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${state.user!.summaryScore.short}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    if (state.history == null) return Container();

                    return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 20,
                      ),
                      itemCount: state.history!.length,
                      itemBuilder: (context, index) {
                        Team redTeam = state.history![index].redTeam;
                        Team blueTeam = state.history![index].blueTeam;
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
                                  redTeam.competitionResult.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: redTeam.team == 'blue'
                                        ? AppPallete.win
                                        : AppPallete.lost,
                                    fontSize: 35,
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
                                  blueTeam.competitionResult.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: AppPallete.win,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
