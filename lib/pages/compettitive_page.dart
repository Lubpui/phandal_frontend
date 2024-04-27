import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/userDB.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class CompPage extends StatefulWidget {
  const CompPage({super.key});

  @override
  State<CompPage> createState() => _CompPageState();
}

final UserModel selectedUser = UserModelDB.modelDB[0];

class _CompPageState extends State<CompPage> {
  bool _isButtonPressed1 = false; // Flag for button 1
  bool _isButtonPressed2 = false; // Flag for button 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
        toolbarHeight: 90,
        surfaceTintColor: AppPallete.transparentColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.only(left: 45.0),
            child: Row(
              children: [
                Text("Code : "),
                Text(
                  "DKL02A",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 303,
              height: 216,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.cyan)),
              child: _isButtonPressed1
                  ? _buildPlayerInfo() // Show info when pressed
                  : Center(
                      child: IconButton(
                        onPressed: () =>
                            setState(() => _isButtonPressed1 = true),
                        icon: const Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Start",
                style: TextStyle(color: AppPallete.batterycolor, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppPallete.buttongradient1),
            ),
            Container(
              width: 303,
              height: 216,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1, color: Colors.cyan)),
              child: _isButtonPressed2
                  ? _buildPlayerInfo() // Show info when pressed
                  : Center(
                      child: IconButton(
                        onPressed: () =>
                            setState(() => _isButtonPressed2 = true),
                        icon: const Icon(
                          Icons.add,
                          size: 50,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerInfo() {
    String playerName = "PatcharaPN";
    int playerHealth = 100;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
              colors: [AppPallete.buttongradient2, AppPallete.buttongradient1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(selectedUser.imageUrl),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            playerName,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text("Team :"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Shot"),
                      Text("10"),
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              animationDuration: 2000,
              percent: 0.9,
              center: Text("90.0%"),
              progressColor: Colors.greenAccent,
            ),
          ),
        ],
      ),
    );
  }
}
