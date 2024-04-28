// ignore_for_file: avoid_print, unnecessary_new, await_only_futures

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/image_helper.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.initials});

  final String initials;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _image;
  final _imageHelper = ImageHelper();

  Future<void> _pickImage() async {
    final image = await _imageHelper.pickImage();
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> uploadImage() async {
    var uri = Uri.parse(
      'https://phandal-backend.onrender.com/api/user/662d207e43d5bc4ca3ffe972/upload/image',
    );

    var request = new http.MultipartRequest('POST', uri);

    request.fields['userId'] = '662d207e43d5bc4ca3ffe972';

    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));

    var response = await request.send();

    print(response.stream);

    if (response.statusCode == 201) {
      print("complete upload");
    } else {
      print("failed");
      print(response.statusCode);
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Customize profile")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 64,
                backgroundImage: _image != null ? FileImage(_image!) : null,
                child: Text(
                  widget.initials,
                  style: const TextStyle(fontSize: 49),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.buttongradient2),
                onPressed: _pickImage,
                child: const Row(
                  children: [
                    Icon(Icons.add, color: AppPallete.iconColor),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Select image",
                      style: TextStyle(color: AppPallete.whiteColor),
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppPallete.buttongradient2),
                onPressed: () {
                  uploadImage();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.save_as_outlined,
                      color: AppPallete.iconColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Save",
                      style: TextStyle(color: AppPallete.whiteColor),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
