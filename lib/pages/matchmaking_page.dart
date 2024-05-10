// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  bool _showTextField = false;
  String? selectedDevices;
  List<String> dropdownItem = [];

  @override
  void initState() {
    final userState = BlocProvider.of<UserBloc>(context).state;
    if (userState.user != null) {
      dropdownItem =
          userState.user!.devices.map((element) => element.name).toList();
    }
    super.initState();
  }

  void _toggleTextField() {
    setState(() {
      _showTextField = !_showTextField;
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppPallete.buttongradient2,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                  hint: const Text("Select Device"),
                  value: selectedDevices,
                  items: dropdownItem.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedDevices = newValue;
                    });
                  },
                  isExpanded: true,
                  dropdownColor: const Color(0xff3E5888),
                  borderRadius: BorderRadius.circular(20),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xff87A2D3),
                  ),
                  iconSize: 20,
                  underline: const SizedBox(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state.user == null) return;

                      var device = state.user?.devices
                          .where((e) => e.name == selectedDevices)
                          .toList();

                      if (device != null && device.isNotEmpty) {
                        GoRouter.of(context)
                            .goNamed('Competitive', extra: device[0].address);
                      }
                    },
                    child: Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                AppPallete.buttongradient2,
                                AppPallete.buttongradient1
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          "Host",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).goNamed('Join');
                },
                child: Container(
                  width: 250,
                  height: 70,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [
                            AppPallete.buttongradient2,
                            AppPallete.buttongradient1
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      "Join",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
