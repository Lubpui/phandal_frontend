// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/utils/utils.dart';
import 'package:phandal_frontend/widget/bottom_sheet.dart';
import 'package:phandal_frontend/model/data_model.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:phandal_frontend/widget/searchbar_widget.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class HomePage extends StatefulWidget {
  final bool start;

  const HomePage({super.key, this.start = true});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<DataModel> _mockUp = [
    DataModel("Gun Device", "2.4 Ghz", true, 70),
    DataModel("Armor Device", "5 Ghz", false, 30),
  ];

  StreamSubscription<BluetoothDiscoveryResult>? _streamSubscription;
  static List<BluetoothDiscoveryResult> myDevice =
      List<BluetoothDiscoveryResult>.empty(growable: true);
  bool isDiscovering = false;

  List<DataModel> display_list = List.from(_mockUp);
  Timer? _debounce;

  void _restartDiscovery() {
    setState(() {
      myDevice.clear();
      isDiscovering = true;
    });

    _startDiscovery();
  }

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

    isDiscovering = widget.start;
    if (isDiscovering) {
      requestBluetoothPermission();
    }

    super.initState();
  }

  void requestBluetoothPermission() async {
    PermissionStatus bluetoothStatus = await Permission.bluetoothScan.request();
    PermissionStatus bluetoothConnectStatus =
        await Permission.bluetoothConnect.request();

    if (bluetoothStatus.isGranted && bluetoothConnectStatus.isGranted) {
      _startDiscovery();
    }
  }

  void _startDiscovery() {
    _streamSubscription =
        FlutterBluetoothSerial.instance.startDiscovery().listen((r) {
      if (r.device.isConnected || r.device.isBonded) {
        setState(() {
          final existingIndex = myDevice.indexWhere(
            (element) => element.device.address == r.device.address,
          );

          if (existingIndex >= 0) {
            myDevice[existingIndex] = r;
          } else {
            myDevice.add(r);
          }
        });
      }
    });

    _streamSubscription!.onDone(() {
      setState(() {
        isDiscovering = false;
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: Color(toIntColor("#496BA5")),
        ),
        child: isDiscovering
            ? FittedBox(
                child: Container(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
            : IconButton(
                icon: Icon(Icons.replay, color: Colors.white),
                onPressed: _restartDiscovery,
                iconSize: 30,
              ),
      ),
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
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            if (state.user != null) {
                              final device = state.user!.devices[index];
                              double bat = myDevice.any((item) =>
                                      item.device.address == device.address)
                                  ? 72 / 100
                                  : 0;
                              return GestureDetector(
                                onTap: () {
                                  if (myDevice.any((item) =>
                                      item.device.address == device.address)) {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      useRootNavigator: true,
                                      context: context,
                                      builder: (ctx) => Sheet(device: device),
                                    );
                                  }
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              device.name,
                                              style: TextStyle(
                                                color: Color(
                                                    toIntColor("#ffffff")),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  device.address,
                                                  style: TextStyle(
                                                    color: Color(
                                                        toIntColor("#678BCA")),
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 5,
                                                  ),
                                                  child: myDevice.any((item) =>
                                                          item.device.address ==
                                                          device.address)
                                                      ? Icon(
                                                          Icons.bluetooth,
                                                          size: 15,
                                                          color: Color(
                                                            toIntColor(
                                                                "#FFFFFF"),
                                                          ),
                                                        )
                                                      : Icon(
                                                          Icons.bluetooth,
                                                          size: 15,
                                                          color: Color(
                                                            toIntColor(
                                                                "#678BCA"),
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
                                          center: myDevice.any((item) =>
                                                  item.device.address ==
                                                  device.address)
                                              ? Text(
                                                  "${72}%",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                    color: Color(
                                                      toIntColor("#FFFFFF"),
                                                    ),
                                                  ),
                                                )
                                              : const Text(''),
                                          circularStrokeCap:
                                              CircularStrokeCap.round,
                                          progressColor:
                                              AppPallete.progressColor,
                                          backgroundColor: AppPallete.greyColor,
                                          animation: true,
                                          animationDuration: 1000,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                            return null;
                          },
                          childCount: state.user?.devices.length,
                        ),
                      );
                    },
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
