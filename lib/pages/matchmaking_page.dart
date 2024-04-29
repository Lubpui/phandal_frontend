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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).goNamed('Competitive');
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ),
                ),
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
