import 'package:flutter/material.dart';
import 'package:phandal_frontend/data/data_model.dart';

class Sheet extends StatefulWidget {
  final DataModel mockUp;
  const Sheet({super.key, required this.mockUp});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  int _selectedColor = 0;

  final List<Color> colors = [
    const Color(0xffFF0000),
    const Color(0xffFFA800),
    const Color(0xffFFF500),
    const Color(0xff00FF1A),
    const Color(0xff0019FF),
  ];

  Widget buildRadioButton(int index) {
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
                  : colors[index],
              width: 5,
            ),
            color: _selectedColor == index ? colors[index] : colors[index],
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
        color: Color(0xff254479),
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
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 5; i++) buildRadioButton(i),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recoil",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "5",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
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
