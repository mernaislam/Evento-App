import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evento_app/core/helpers/firebase_manager.dart';
import 'package:evento_app/features/create_event/ui/widgets/location_picker_dialog.dart';
import 'package:evento_app/features/event_integration/data/models/category_model.dart';
import 'package:evento_app/features/event_integration/data/repositories/category_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import '../../../auth/data/model/user_model.dart';
import '../../../event_integration/data/models/event_model.dart';
import '../widgets/custom_textfield.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _eventDescriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _minPriceController = TextEditingController();
  final TextEditingController _maxPriceController = TextEditingController();
  final FocusNode _startDateFocus = FocusNode();
  final FocusNode _endDateFocus = FocusNode();
  final FocusNode _startTimeFocus = FocusNode();
  final FocusNode _endTimeFocus = FocusNode();
  bool _isStartDateSelected = false;
  bool _isStartTimeSelected = false;
  DateTime? pickedStartDate;
  DateTime? pickedEndDate;
  bool _isButtonEnabled = false;
  String? selectedCategory;
  late Category chosenCategory;


  CollectionReference events = FirebaseFirestore.instance.collection('events');
  
  Future<void> addEvent() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        locations[0].latitude, locations[0].longitude);
  String? chosenImageUrl;
  if (_chosenImage != null) {
    chosenImageUrl = await FirebaseManager.uploadImageToFirebase(File(_chosenImage!.path));
  } else {
    chosenImageUrl = "";
  }
  final Account user = await Account.fetchAccountById(FirebaseAuth.instance.currentUser!.uid);
  Event event = Event(
    organizer: user,
    category: chosenCategory,
    id: "0",
    attendees: [],
    title: _eventNameController.text,
    description: _eventDescriptionController.text,
 startTime: DateTime.parse("${_startDateController.text} ${_startTimeController.text}"),
  endTime: DateTime.parse("${_endDateController.text} ${_endTimeController.text}"),
    location: GeoPoint(locations[0].latitude, locations[0].longitude),
    imagesUrl: [chosenImageUrl],
    minPrice: int.tryParse( _minPriceController.text)??0,
    maxPrice: int.tryParse( _maxPriceController.text)??0,
    street: placemarks[0].street.toString(),
    city: placemarks[0].locality.toString(),
    country: placemarks[0].country.toString(),
  );
  // Add event to Firestore and get the document reference
  DocumentReference eventRef = await events.add(event.toJson());

  // Assuming you have the user's document reference
  DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(user.id);

  // Update the user's document to include the new event reference
  await userRef.update({
    'events': FieldValue.arrayUnion([eventRef])
  });

  // Show success dialog
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Success"),
        content: const Text("Event Created Successfully"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}

  List<Location> locations = [];
  final FocusNode _locationFocus = FocusNode();
  Placemark place = const Placemark();
  final _picker = ImagePicker();
  XFile? _chosenImage;

  @override
  void initState() {
    super.initState();
    _eventNameController.addListener(_checkIfAllFieldsAreFilled);
    _eventDescriptionController.addListener(_checkIfAllFieldsAreFilled);
    _startDateController.addListener(_checkIfAllFieldsAreFilled);
    _endDateController.addListener(_checkIfAllFieldsAreFilled);
    _startTimeController.addListener(_checkIfAllFieldsAreFilled);
    _endTimeController.addListener(_checkIfAllFieldsAreFilled);
    _locationController.addListener(_checkIfAllFieldsAreFilled);
    _minPriceController.addListener(_checkIfAllFieldsAreFilled);
    _maxPriceController.addListener(_checkIfAllFieldsAreFilled);
  }

  void _checkIfAllFieldsAreFilled() {
    setState(() {
      _isButtonEnabled = _eventNameController.text.isNotEmpty &&
                         _eventDescriptionController.text.isNotEmpty &&
                         _startDateController.text.isNotEmpty &&
                         _endDateController.text.isNotEmpty &&
                         _startTimeController.text.isNotEmpty &&
                         _endTimeController.text.isNotEmpty &&
                         _locationController.text.isNotEmpty &&
                         _minPriceController.text.isNotEmpty &&
                         _maxPriceController.text.isNotEmpty;
    });
  }

  @override
  void dispose(){
    _eventNameController.dispose();
    _eventDescriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _locationController.dispose();
    _minPriceController.dispose();
    _maxPriceController.dispose();
    _startDateFocus.dispose();
    _endDateFocus.dispose();
    _startTimeFocus.dispose();
    _endTimeFocus.dispose();
    _locationFocus.dispose();
    super.dispose();
  }

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

  Future<void> _selectStartTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _startTimeController.text = picked.format(context);
        _isStartTimeSelected = true;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _endTimeController.text = picked.format(context);
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    pickedStartDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedEndDate != null && pickedStartDate!.isAfter(pickedEndDate!)) {
      setState(() {
        _endDateController.text = "";
      });
    }
    if (pickedStartDate != null) {
      setState(() {
        _startDateController.text = pickedStartDate.toString().split(" ")[0];
        _isStartDateSelected = true;
      });
    }
    _startDateFocus.unfocus();
  }

  Future<void> _selectEndDate(BuildContext context) async {
    pickedEndDate = await showDatePicker(
      context: context,
      initialDate: pickedStartDate!,
      firstDate: pickedStartDate!,
      lastDate: DateTime(2101),
    );
    if (pickedEndDate != null) {
      setState(() {
        _endDateController.text = pickedEndDate.toString().split(" ")[0];
        _isStartDateSelected = true;
      });
    }
    _startDateFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create an Event",),
        foregroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer(
        builder:(context, ref, child) {
          final categoryListAsyncValue = ref.watch(categoryListProvider);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(height:100),
                Stack(
                  children: [
                    Container(
                      child: _chosenImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                            child: Image.file(
                                File(_chosenImage!.path),
                                fit: BoxFit.contain,
                                height: 300,
                                width: double.infinity,
                              ),
                          )
                          : const Icon(
                              Icons.image,
                              size: 400,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                    if (_chosenImage != null)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              _chosenImage = null;
                            });
                          },
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 10),
                CustomTextField(label: "Event Name", controller: _eventNameController),
            categoryListAsyncValue.when(
              data: (categories) => DropdownButton<String>(
                value: selectedCategory,
                hint: const Text('Select Category'),
                items: categories.map((Category category) {
                  return DropdownMenuItem<String>(
                    value: category.type,
                    child: Text(category.type),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                    chosenCategory = categories.firstWhere((cat) => cat.type == newValue);

                  });
                },
              ),
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error'),
            ),
                const SizedBox(height: 10),
                CustomTextField(label: "Event Description", controller: _eventDescriptionController),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: _startDateFocus,
                  label: "Start Date",
                  controller: _startDateController,
                  readOnly: true,
                  onTap: () => _selectStartDate(context),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: _isStartDateSelected,
                  child: CustomTextField(
                    focusNode: _endDateFocus,
                    label: "End Date",
                    controller: _endDateController,
                    readOnly: true,
                    onTap: () => _selectEndDate(context),
                  ),
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  focusNode: _startTimeFocus,
                  label: "Start Time",
                  controller: _startTimeController,
                  readOnly: true,
                  onTap: () => _selectStartTime(context),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: _isStartTimeSelected,
                  child: CustomTextField(
                    focusNode: _endTimeFocus,
                    label: "End Time",
                    controller: _endTimeController,
                    readOnly: true,
                    onTap: () => _selectEndTime(context),
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  focusNode: _locationFocus,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyLarge,
                    hintStyle: Theme.of(context).textTheme.bodyLarge,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    prefixIcon: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const LocationPickerDialog();
                            },
                          ).then((value) async {
                            setState(() {
                              _locationController.text = value.toString();
                            });
        
                            try {
                              locations = await locationFromAddress(
                                  _locationController.text);
                            } catch (e) {}
                            _locationFocus.unfocus();
                          });
                        },
                        child: const Icon(Icons.location_on)),
                    labelText: "Event Location",
                    suffixIcon: IconButton(
                      onPressed: () async {
                        try {
                          locations =
                              await locationFromAddress(_locationController.text);
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Error", 
                                  style: TextStyle(color: Theme.of(context).primaryColor)),
                                  content: Text("Invalid Location", style : Theme.of(context).textTheme.bodyMedium),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("OK", style: TextStyle(color: Theme.of(context).primaryColor)),
                                    ),
                                  ],
                                );
                              });
                        }
                      },
                      icon: const Icon(Icons.check),
                    ),
                  ),
                  controller: _locationController,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child:  CustomTextField(
                        controller: _minPriceController,
                        label: "Minimum Price",
                        keyboardType: TextInputType.number,
                        ),
                    ),
                    const SizedBox(width: 10),
                Expanded(
                  child:  CustomTextField(
                    controller: _maxPriceController,
                    label: "Maximum Price",
                    keyboardType: TextInputType.number,
                  ),
                ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: _isButtonEnabled?Theme.of(context).primaryColor: Colors.grey,
                    ).copyWith(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _isButtonEnabled?
                      {
                        addEvent()
        
                      }
                      : null;
                  
                    },
                    child: Text("Create Event",
                    style: Theme.of(context).textTheme.bodyLarge
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        }
      ),
  
    );
  }
}
