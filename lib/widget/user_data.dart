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

class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Usermodel selecteduser = modelDB[0];
    return Center(
      child: Container(
        width: 320,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  selecteduser.imageUrl,
                ),
                radius: 30,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 15),
                  child: Text(
                    selecteduser.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_document,
                    size: 15,
                    color: AppPallete.iconColor,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
