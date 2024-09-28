import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventLocation extends StatelessWidget {
  const EventLocation({
    super.key,
    required this.location,
  });
  final GeoPoint location;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Location',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
    );
    // TODO: Implement MapView API
  }
}