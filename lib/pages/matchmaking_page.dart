import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/widget/user_data.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  bool _showTextField = false;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: _toggleTextField,
              child: Container(
                width: 300,
                height: 100,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      AppPallete.buttongradient2,
                      AppPallete.buttongradient1
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    "Play",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _showTextField ? 1.0 : 0.0,
            duration:
                const Duration(milliseconds: 300), // Adjust duration as needed
            curve:
                Curves.fastEaseInToSlowEaseOut, // Add desired animation curve
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push(context.namedLocation('ComppititivePage'));
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: GestureDetector(
                    onTap: () {
                      context.push(context.namedLocation('JoinPage'));
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
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
    );
  }
}
