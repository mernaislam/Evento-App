import 'package:flutter/material.dart';

class EventTitle extends StatelessWidget {
  const EventTitle({
    super.key,
    required this.title,
    required this.categoryName,
    required this.going,
  });
  final String title;
  final String categoryName;
  final List<String> going;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -------- Add Event Title here --------
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              // -------- Add Event Category name here --------
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              width: 17,
            ),
            // -------- TODO --------
            Text(
              '20,000+ going',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward,
                size: 20,
              ),
            )
          ],
        ),
      ],
    );
  }
}
