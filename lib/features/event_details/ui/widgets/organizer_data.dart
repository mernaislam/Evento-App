import 'package:evento_app/features/auth/data/model/user_model.dart';
import 'package:flutter/material.dart';

class EventOrganizerData extends StatelessWidget {
  const EventOrganizerData({
    super.key,
    required this.oragnizer,
  });
  final Account oragnizer;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(padding: EdgeInsets.zero),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
          width: 60,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              oragnizer.profileImage,
            ),
          ),
        ),
        title: Text(
          oragnizer.fullName,
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
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
