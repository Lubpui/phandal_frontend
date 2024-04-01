import 'package:flutter/material.dart';

import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/usermodel.dart';

final List<Usermodel> modelDB = [
  Usermodel(
    name: "PatcharaPN",
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_CCRvW0Z7s0SH-1TFYoKxDg5P6A34J6XsyqUJEk4XYQ&s',
  )
];

class UserButton extends StatelessWidget {
  const UserButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Usermodel selecteduser = modelDB[0];
    return Center(
      child: Container(
        width: 350,
        height: 110,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            gradient: const LinearGradient(colors: [
              AppPallete.buttongradient2,
              AppPallete.buttongradient1,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  selecteduser.imageUrl,
                ),
                radius: 40,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    selecteduser.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View Account",
                    style: TextStyle(color: AppPallete.subtitlecolor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppPallete.logoutButton),
              child: const Text(
                "Log out",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: AppPallete.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
