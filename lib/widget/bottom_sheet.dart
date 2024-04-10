import 'package:flutter/material.dart';
import 'package:phandal_frontend/model/color_model.dart';
import 'package:phandal_frontend/model/data_model.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/utils/utils.dart';

class Sheet extends StatefulWidget {
  final DataModel mockUp;
  const Sheet({super.key, required this.mockUp});

  @override
  State<Sheet> createState() => _SheetState();
}

void _closeBottomSheet(BuildContext context) {
  Navigator.pop(context);
}

class _SheetState extends State<Sheet> {
  //widget 5 Colors
  int _selectedColor = 0;
  double _current = 0;

  //widget Dropdown
  String? selectedValue;
  List<String> dropdownItem = ["Item 1", "Item 2", "Item 3"];

  final List<ColorObject> colors = [
    ColorObject(primary: "#FF0000", secondary: "#FF7373", name: "red"),
    ColorObject(primary: "#FFA800", secondary: "#FFCC6A", name: "orange"),
    ColorObject(primary: "#FFF500", secondary: "#FFFCAB", name: "yellow"),
    ColorObject(primary: "#00FF1A", secondary: "#8EFF99", name: "green"),
    ColorObject(primary: "#0019FF", secondary: "#4F76FF", name: "blue"),
  ];

  Widget Radiopress(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _selectedColor == index
                  ? Color(toIntColor("#6BC7E9"))
                  : Color(toIntColor(colors[index].secondary)),
              width: 5,
            ),
            color: _selectedColor == index
                ? Color(toIntColor(colors[index].primary))
                : Color(toIntColor(colors[index].primary)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppPallete.buttongradient2, AppPallete.buttongradient1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 30)),
          Text(
            "Light Color for ${widget.mockUp.name} ${widget.mockUp.network}",
            style: const TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 17,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 28),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 5; i++) Radiopress(i),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recoil",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 17,
                  ),
                ),
                Text(
                  _current.round().toString(),
                  style: const TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, right: 10, left: 15),
            child: Slider(
              value: _current,
              min: 0,
              max: 5,
              activeColor: const Color(0xff6BC7E9),
              thumbColor: const Color(0xffD9D9D9),
              onChanged: (value) {
                setState(() {
                  _current = value;
                });
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff3E5888),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: DropdownButton<String>(
                        hint: const Text("Select Mode"),
                        value: selectedValue,
                        items: dropdownItem.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        isExpanded: true,
                        dropdownColor: const Color(0xff3E5888),
                        borderRadius: BorderRadius.circular(20),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff87A2D3),
                        ),
                        iconSize: 20,
                        underline: const SizedBox(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("Save");
                      _closeBottomSheet(context);
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xff6BC7E9),
                      ),
                      child: const Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                            color: Color(0xff1E345C),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: GestureDetector(
                    onTap: () {
                      print("Disconnect");
                      _closeBottomSheet(context);
                    },
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color(0xffFF6767),
                      ),
                      child: const Center(
                        child: Text(
                          "Disconnect",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Map<String, dynamic> body = {
                  "color": colors[_selectedColor].name,
                  "recoil": _current.toStringAsFixed(0),
                  "mode": selectedValue
                };
                print(body);
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xff6BC7E9),
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Color(0xff1E345C),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                print("Disconnection");
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffFF6767),
                ),
                child: const Center(
                  child: Text(
                    "Disconnection",
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
