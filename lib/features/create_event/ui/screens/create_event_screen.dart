import 'dart:async';
import 'dart:io';

import 'package:evento_app/features/create_event/ui/widgets/location_picker_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  GoogleMapController? _gmc;
  Placemark place = const Placemark();
  final _picker = ImagePicker();
  XFile? _chosenImage;

  void _pickImage() async {
    _chosenImage = await _picker.pickImage(source: ImageSource.gallery);
    if (_chosenImage != null) {
      final filePath = _chosenImage!.path;

      final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
      final splitted = filePath.substring(0, (lastIndex));
      final outPath = "${splitted}_compressed.jpg";

      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        _chosenImage!.path,
        outPath,
        quality: 88,
      );
      setState(() {
        _chosenImage = XFile(compressedImage!.path);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? _picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (_picked != null) {
      setState(() {
        _timeController.text = _picked.format(context);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: _chosenImage != null
                  ? Image.file(
                      File(_chosenImage!.path),
                      fit: BoxFit.fill,
                    )
                  : const Icon(
                      Icons.image,
                      size: 400,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_chosenImage != null)
                IconButton(
                    onPressed: () {
                      setState(() {
                        _chosenImage = null;
                      });
                    },
                    icon: const Icon(Icons.delete)),
                const SizedBox(width: 20),
                IconButton(
                    onPressed: _pickImage, icon: const Icon(Icons.add_a_photo)),
              ],
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Event Name",
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Event Description",
              ),
            ),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: "Event Date",
              ),
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Event Time",
              ),
              controller: _timeController,
              readOnly: true,
              onTap: () => _selectTime(context),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const LocationPickerDialog();
                        },
                      ).then(
                        (value) => _locationController.text = value.toString(),
                      );
                    },
                    child: const Icon(Icons.map)),
                labelText: "Event Location",
              ),
              controller: _locationController,
              onChanged: (value) async {
                try {
                  List<Location> locations =
                      await locationFromAddress(_locationController.text);
                } catch (e) {
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
