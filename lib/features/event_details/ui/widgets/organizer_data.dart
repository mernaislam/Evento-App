import 'package:flutter/material.dart';

class EventOrganizerData extends StatelessWidget {
  const EventOrganizerData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const SizedBox(
        width: 60,
        child: CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_640.jpg',
          ),
        ),
      ),
      title: Text(
        'World of Music',
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        'Organizer',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(
          'Follow',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
