import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  void _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _pickedImage = image != null ? File(image.path) : _pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _pickedImage == null
              ? CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                  ),
                )
              : CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  backgroundImage: FileImage(_pickedImage!),
                ),
          CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 20,
            child: IconButton(
              onPressed: _pickImageFromGallery,
              icon: const Icon(
                Icons.add_a_photo,
                size: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
