import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/utils/utils.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.onChanged});

  final void Function(String) onChanged;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPallete.searchbarcolor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        autofocus: false,
        onChanged: widget.onChanged,
        style: const TextStyle(
          color: AppPallete.whiteColor,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 50,
            vertical: 15,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              Icons.search,
              size: 40,
              color: Color(toIntColor("#5B7299")),
            ),
          ),
          hintText: "Search Devices",
          hintStyle: TextStyle(color: Color(toIntColor("#496BA5"))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
