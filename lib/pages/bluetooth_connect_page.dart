import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/device_widget.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class BluetoothConnectPage extends StatefulWidget {
  const BluetoothConnectPage({super.key});

  @override
  State<BluetoothConnectPage> createState() => _BluetoothConnectPageState();
}

class _BluetoothConnectPageState extends State<BluetoothConnectPage> {
  final bool isConnected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("My devices"),
              ),
              const SizedBox(
                height: 10,
              ),
              //Device Data from bluetooth
              isConnected
                  ? const DeviceWidget()
                  : const Text('Device not connected'),
            ],
          ),

          //Device not connected
          const SizedBox(
            height: 30,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Other devices"),
              ),
              SizedBox(
                height: 10,
              ),
              //Device Data from bluetooth
              DeviceWidget(),
              DeviceWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
