import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          color: AppPallete.searchbarcolor,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: TextField(
            decoration: const InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: InputBorder.none),
            onChanged: (value) {
              
            },
          ),
        ),
      ),
    );
  }
}
