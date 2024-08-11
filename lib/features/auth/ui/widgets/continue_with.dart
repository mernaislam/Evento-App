import 'package:flutter/material.dart';

class ContinueWith extends StatelessWidget {
  const ContinueWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "or continue with",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
