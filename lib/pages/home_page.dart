// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/utils/utils.dart';
import 'package:phandal_frontend/widget/bottom_sheet.dart';
import 'package:phandal_frontend/model/data_model.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phandal_frontend/widget/searchbar_widget.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<DataModel> _mockUp = [
    DataModel("Gun Device", "2.4 Ghz", true, 70),
    DataModel("Armor Device", "5 Ghz", false, 30),
  ];

  List<DataModel> display_list = List.from(_mockUp);
  Timer? _debounce;

  void updateList(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {
        display_list = _mockUp
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void initState() {
    context.read<UserBloc>().add(UserEventGetUser());
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
      backgroundColor: Color(toIntColor('#101F3D')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SearchBarWidget(onChanged: (value) => updateList(value)),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final wifi = _mockUp[index];
                        double bat = display_list[index].number / 100;
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              useRootNavigator: true,
                              context: context,
                              builder: (ctx) => Sheet(
                                mockUp: wifi,
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                gradient: LinearGradient(
                                    colors: [
                                      AppPallete.buttongradient2,
                                      AppPallete.buttongradient1,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              height: 100,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        display_list[index].name,
                                        style: TextStyle(
                                          color: Color(toIntColor("#ffffff")),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            display_list[index].network,
                                            style: TextStyle(
                                              color:
                                                  Color(toIntColor("#678BCA")),
                                              fontSize: 14,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: display_list[index].lock
                                                ? Icon(
                                                    Icons.bluetooth,
                                                    size: 15,
                                                    color: Color(
                                                      toIntColor("#FFFFFF"),
                                                    ),
                                                  )
                                                : Icon(
                                                    Icons.bluetooth,
                                                    size: 15,
                                                    color: Color(
                                                      toIntColor("#678BCA"),
                                                    ),
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  CircularPercentIndicator(
                                    radius: 35.0,
                                    lineWidth: 5,
                                    percent: bat,
                                    center: Text(
                                      "${display_list[index].number}%",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(toIntColor("#FFFFFF"))),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: AppPallete.progressColor,
                                    backgroundColor: AppPallete.greyColor,
                                    animation: true,
                                    animationDuration: 1000,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: display_list.length,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed('BluetoothConnect');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            gradient: LinearGradient(
                                colors: [
                                  AppPallete.buttongradient2,
                                  AppPallete.buttongradient1
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 40,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
