import 'dart:io';

import 'package:evento_app/features/auth/logic/image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends ConsumerStatefulWidget {
  const ImageUpload({super.key});

  @override
  ConsumerState<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends ConsumerState<ImageUpload> {
  final ImagePicker _imagePicker = ImagePicker();
  File? _pickedImage;

  void _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      var imagePath = image.path;
      setState(() {
        _pickedImage = File(imagePath);
      });
      ref.read(imageProvider.notifier).state = _pickedImage;
    }
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
