import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phandal_frontend/core/theme/app_pallete.dart';
import 'package:phandal_frontend/image_helper.dart';
import 'package:http/http.dart' as http;
import 'package:phandal_frontend/routes/app_router.dart';

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
                onPressed: () async {
                  final token = AppRouter.fss.read(key: 'accessToken');
                  print(_image);
                  var stream = new http.ByteStream(_image!.openRead());
                  stream.cast();

                  var length = await _image!.length();

                  var uri = Uri.parse(
                      'https://phandal-backend.onrender.comapi/user/662d15ec43d5bc4ca3ffe934/upload/image');

                  var req = await http.MultipartRequest(
                    'POST',
                    uri,
                  );
                  var multiport =
                      new http.MultipartFile('image', stream, length);

                  req.files.add(multiport);

                  var response = await req.send();

                  if (response.statusCode == 201) {
                    print("INTERNALPOINTTHATVARIABLE");
                  }
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
