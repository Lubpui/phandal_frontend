// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/usermodel.dart';
import 'package:phandal_frontend/routes/app_router.dart';

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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [
              AppPallete.buttongradient2,
              AppPallete.buttongradient1,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    selecteduser.imageUrl,
                  ),
                  radius: 35,
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      selecteduser.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "View Account",
                      style: TextStyle(
                        color: AppPallete.subtitlecolor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                await AppRouter.fss.delete(key: 'accessToken');
                context.push(context.namedLocation('Login'));
                print('Logout successfully...');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppPallete.logoutButton,
                maximumSize: const Size(110, 50),
              ),
              child: const Text(
                "Log out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppPallete.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
