import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Center(
        child: Container(
          width: 305,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              AppPallete.buttongradient2,
              AppPallete.buttongradient1,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Device name"),
                    Text("MacAddress name"),
                  ],
                ),
                Icon(
                  Icons.bluetooth,
                  color: AppPallete.batterycolor,
                  size: 28,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
