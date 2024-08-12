import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class LocationPickerDialog extends StatefulWidget {
  const LocationPickerDialog({super.key});

  @override
  LocationPickerDialogState createState() => LocationPickerDialogState();
}

class LocationPickerDialogState extends State<LocationPickerDialog> {
  bool _isLoading = false;
  Marker _marker = const Marker(markerId: MarkerId("1"));
  final TextEditingController _locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context,"");
          },
          child: const Text("Cancel"),
        ),
                  ElevatedButton(
            onPressed: () {
              Navigator.pop(context, _locationController.text);
            },
            child: const Text("Confirm Location"),
          ),

      ],
      title: const Center(child: Text("Select Location")),
      content: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  markers: {
                    _marker,
                  },
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(30.033333, 31.233334),
                    zoom: 14.4746,
                  ),
                  onTap: ((argument) async {
                    setState(() {
                      _isLoading = true;
                    });
          
                    List<Placemark> placemarks = await placemarkFromCoordinates(
                        argument.latitude, argument.longitude);
                    _locationController.text =
                        "${placemarks[0].street}, ${placemarks[0].administrativeArea}, ${placemarks[0].country}";
                    setState(() {
                      _marker = Marker(
                        markerId: const MarkerId("1"),
                        position: argument,
                        infoWindow: InfoWindow(
                          title: "Event Location",
                          snippet: placemarks[0].street.toString(),
                        ),
                      );
                      _isLoading = false;
                    });
                  }),
                ),
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}