// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key, required this.currentIndex, this.onTap});

  final int currentIndex;
  final void Function(int)? onTap;

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.0, left: 25.0, right: 25.0, top: 10),
      child: SizedBox(
        height: 70,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: AppPallete.transparentColor,
            highlightColor: AppPallete.transparentColor,
          ),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(60),
            color: Color(0xFF26457B),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                selectedIconTheme: IconThemeData(
                  color: AppPallete.iconColor,
                ),
                unselectedIconTheme: IconThemeData(
                  color: AppPallete.unselectIcon,
                ),
                onTap: widget.onTap,
                currentIndex: widget.currentIndex,
                selectedItemColor: AppPallete.selecterIcon,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 35,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fiber_smart_record_outlined),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.scoreboard_outlined),
                    label: 'Notifications',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.setting_24),
                    label: 'Notifications',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
/* dashboard */