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
      backgroundColor: Theme.of(context).cardColor,
      leading: IconButton(
        onPressed: () {
          // navigate to home screen
        },
        icon: Icon(Icons.arrow_back,
            size: 33, color: Theme.of(context).textTheme.bodyLarge!.color),
      ),
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
