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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_document,
                size: 15,
                color: AppPallete.iconColor,
              ),
            ),
          ),
          Text(
            selecteduser.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: NetworkImage(
              selecteduser.imageUrl,
            ),
            radius: 30,
          ),
        ],
      ),
    );
  }
}
