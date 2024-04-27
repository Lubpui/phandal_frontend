import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [UserData()],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.5, color: AppPallete.iconColor)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Enter room code",
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                context.push(context.namedLocation('ComppititivePage'));
              },
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    AppPallete.buttongradient2,
                    AppPallete.buttongradient1,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text("Join")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
