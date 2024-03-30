import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phandal_frontend/bottom_sheet.dart';
import 'package:phandal_frontend/data/data_model.dart';

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
      backgroundColor: const Color(0xff101F3D),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 40, bottom: 20),
            child: TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(
                color: Color(0xffFFFFFF),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                filled: true,
                fillColor: const Color(0xff253960),
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
                              context: context,
                              builder: (ctx) => Sheet(
                                    mockUp: wifi,
                                  ));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35)),
                                  color: Color(0xff254479),
                                ),
                                width: 400,
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 35),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: display_list[index].lock
                                                    ? const Icon(
                                                        Icons.bluetooth,
                                                        size: 15,
                                                        color:
                                                            Color(0xffFFFFFF))
                                                    : const Icon(
                                                        Icons.bluetooth,
                                                        size: 15,
                                                        color:
                                                            Color(0xff678BCA)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    CircularPercentIndicator(
                                      radius: 30.0,
                                      lineWidth: 5,
                                      percent: bat,
                                      center: Text(
                                        "${display_list[index].number}%",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color(0xfFFFFFFF)),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: const Color(0xff82E2F7),
                                      backgroundColor: const Color(0xffFFFFFF),
                                      animation: true,
                                      animationDuration: 1000,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    childCount: display_list.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 30),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Color(0xff254479),
                        ),
                        width: 400,
                        height: 100,
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 40),
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
    );
  }
}
