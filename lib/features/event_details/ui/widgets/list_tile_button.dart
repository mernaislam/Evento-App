import 'package:flutter/material.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({
    super.key,
    required this.buttonText,
  });
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        icon: const Icon(
          Icons.calendar_month_rounded,
          size: 17,
          color: Colors.white,
        ),
        label: Text(
          buttonText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
