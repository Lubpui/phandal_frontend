import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/model/data_model.dart';

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

  final List<int> colors = [
    0xffFF0000,
    0xffFFA800,
    0xffFFF500,
    0xff00FF1A,
    0xff0019FF,
  ];

  final List<int> colors2 = [
    0xffFF7373,
    0xffFFCC6A,
    0xffFFFCAB,
    0xff8EFF99,
    0xff4F76FF,
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
                  ? const Color(0xff6BC7E9)
                  : Color(colors2[index]),
              width: 5,
            ),
            color: _selectedColor == index
                ? Color(colors[index])
                : Color(colors[index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
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
            padding: const EdgeInsets.only(left: 20, right: 20, top: 28),
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
            padding: const EdgeInsets.only(top: 28, right: 20, left: 20),
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
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
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
          )
        ],
      ),
    );
  }
}
