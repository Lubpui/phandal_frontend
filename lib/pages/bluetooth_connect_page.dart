import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:phandal_frontend/widget/device_widget.dart';
import 'package:phandal_frontend/widget/searchbar_widget.dart';
import 'package:phandal_frontend/widget/user_data_left.dart';

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 45.0),
                child: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 35.0),
                child: UserData(),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
/*               Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  ),
                  const UserData(),
                ],
              ), */
              const SearchBarWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 45.0, bottom: 20),
                    child: Text(
                      "My devices",
                      style:
                          TextStyle(color: Color.fromARGB(80, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Device Data from bluetooth
                  isConnected
                      ? const DeviceWidget()
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Device not connected',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(80, 255, 255, 255),
                              ),
                            )
                          ],
                        ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 45.0, top: 20),
                        child: Text(
                          "Other devices",
                          style: TextStyle(
                              color: Color.fromARGB(80, 255, 255, 255)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //Device Data from bluetooth
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const DeviceWidget();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
