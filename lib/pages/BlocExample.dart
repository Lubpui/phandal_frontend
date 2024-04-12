// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/bloc/device_bloc/device_bloc.dart';
import 'package:phandal_frontend/bloc/device_bloc/device_events.dart';
import 'package:phandal_frontend/bloc/device_bloc/device_states.dart';
import 'package:phandal_frontend/model/bluetooth_model.dart';
import 'package:phandal_frontend/repository/bluetooth_repository/bluetooth.dart';
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
    return BlocProvider(
      create: (context) => BTBloc(
        RepositoryProvider.of<BluetoothRepository>(context),
      )..add(LoadingBTEvent()),
      child: Scaffold(
          appBar: AppBar(
            actions: const [UserData()],
            toolbarHeight: 90,
            surfaceTintColor: AppPallete.transparentColor,
          ),
          backgroundColor: Color(toIntColor('#101F3D')),
          body: BlocBuilder<BTBloc, BTState>(
            builder: (context, state) {
              if (state is BTLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BTloaded) {
                List<BluetoothModel> devicedb = state.devices;
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemCount: devicedb.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 350,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [
                                  AppPallete.buttongradient2,
                                  AppPallete.buttongradient1
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(devicedb[index].bluetoothName),
                                Text(devicedb[index].bluetoothMacId),
                              ],
                            ),
                            Text(devicedb[index].battery.toString())
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          )),
    );
  }
}
