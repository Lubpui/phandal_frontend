import 'package:flutter/material.dart';
import 'package:phandal_frontend/data/data_model.dart';

class Sheet extends StatefulWidget {
  final DataModel mockUp;
  const Sheet({super.key, required this.mockUp});

  @override
  State<Sheet> createState() => _SheetState();
}

class _SheetState extends State<Sheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
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
          const Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            "Enter the password for ${widget.mockUp.name} ${widget.mockUp.network}",
            style: const TextStyle(
              color: Color(0xffFFFFFF),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: const Text('Cancel',
                      style: TextStyle(color: Color(0xff35B6FF))),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                // Text('Cancel', style: TextStyle(color: Color(0xff35B6FF))),
                const Text('Enter Password',
                    style: TextStyle(color: Color(0xffFFFFFF))),
                InkWell(
                  child: const Text('Join',
                      style: TextStyle(color: Color(0xff35B6FF))),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
            child: TextField(
              style: const TextStyle(
                color: Color(0xffFFFFFF),
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                filled: true,
                fillColor: const Color(0xff1D3054),
                hintText: "Password",
                hintStyle: const TextStyle(color: Color(0xff496BA5)),
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Icon(
                    Icons.visibility,
                    size: 20,
                    color: Color(0xff35B6FF),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
