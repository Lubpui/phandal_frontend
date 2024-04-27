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
    return Expanded(
      child: GestureDetector(
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      height: MediaQuery.of(context).size.height * 0.70,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Light Color for ${widget.mockUp.name} ${widget.mockUp.network}",
                style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 5; i++) Radiopress(i),
                ],
              ),
              const SizedBox(height: 20),
              Row(
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
              Slider(
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
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
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
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Map<String, dynamic> body = {
                    "color": colors[_selectedColor].name,
                    "recoil": _current.toStringAsFixed(0),
                    "mode": selectedValue
                  };
                  print(body);
                },
                child: Container(
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
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print("Disconnect");
                },
                child: Container(
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
            ],
          ),
        ],
      ),
    );
  }
}
