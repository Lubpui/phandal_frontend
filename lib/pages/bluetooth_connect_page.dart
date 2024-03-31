import 'package:flutter/material.dart';
import 'package:phandal_frontend/widget/device_widget.dart';
import 'package:phandal_frontend/widget/searchbar_widget.dart';

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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(100), child: SearchBarWidget()),
          )),
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
