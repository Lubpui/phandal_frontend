import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class CompPage extends StatelessWidget {
  const CompPage({super.key});

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
              child: Center(
                child: IconButton(
                  onPressed: () {},
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
              child: Center(
                child: IconButton(
                  onPressed: () {},
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
}
