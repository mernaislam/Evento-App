import 'package:flutter/material.dart';

final ScrollController scrollController = ScrollController();

class MyEventsAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyEventsAppBar({super.key});

  @override
  State<MyEventsAppBar> createState() => _MyEventsAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyEventsAppBarState extends State<MyEventsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'My Events',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      backgroundColor: Theme.of(context).cardColor,
      actions: [
        IconButton(
            onPressed: () {
              // navigate to create event screen
            },
            icon: Icon(Icons.add,
                size: 37, color: Theme.of(context).textTheme.bodyLarge!.color)),
      ],
    );
  }
}
