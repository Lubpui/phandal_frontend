// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phandal_frontend/bloc/user/user_bloc.dart';

import 'package:phandal_frontend/core/theme/app_pallete.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {
                context.push(context.namedLocation('ProfilePage'));
              },
              icon: const Icon(
                Icons.edit_document,
                size: 15,
                color: AppPallete.iconColor,
              ),
            ),
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return Text(
                state.username,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              );
            },
          ),
          const SizedBox(width: 10),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return CircleAvatar(
                backgroundImage: NetworkImage(state.image),
                radius: 30,
              );
            },
          ),
        ],
      ),
    );
  }
}
