// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/widget/bottom_sheet.dart';
import 'package:phandal_frontend/model/data_model.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<DataModel> _mockUp = [
    DataModel("HamHarry", "2.4 Ghz", true, 70),
    DataModel("Google", "5 Ghz", false, 30),
    DataModel("Welcome", "2.4 Ghz", false, 100),
    DataModel("HyperX", "2.4 Ghz", true, 50),
    DataModel("Iphone", "2.4 Ghz", true, 20),
    DataModel("BUMAIL", "5 Ghz", false, 30),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
      ),
      backgroundColor: const Color(0xff101F3D),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppPallete.searchbarcolor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                autofocus: false,
                onChanged: (value) => updateList(value),
                style: const TextStyle(
                  color: AppPallete.whiteColor,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Icon(
                      Icons.search,
                      size: 40,
                      color: Color(0xff5B7299),
                    ),
                  ),
                  hintText: "Search Devices",
                  hintStyle: const TextStyle(color: Color(0xff496BA5)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
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
                                  Radius.circular(35),
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
                              height: 110,
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
                                        style: const TextStyle(
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            display_list[index].network,
                                            style: const TextStyle(
                                              color: Color(0xff678BCA),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: display_list[index].lock
                                                ? const Icon(Icons.bluetooth,
                                                    size: 15,
                                                    color: Color(0xffFFFFFF))
                                                : const Icon(Icons.bluetooth,
                                                    size: 15,
                                                    color: Color(0xff678BCA)),
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
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Color(0xfFFFFFFF)),
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
                          height: 110,
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
