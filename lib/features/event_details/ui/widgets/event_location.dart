import 'package:flutter/material.dart';

class EventLocation extends StatelessWidget {
  const EventLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Location',
      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 25),
    );
    // Location to be implemented;
  }
}
