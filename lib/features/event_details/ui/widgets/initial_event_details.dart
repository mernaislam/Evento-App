import 'package:evento_app/features/event_details/ui/widgets/custom_list_tile.dart';
import 'package:evento_app/features/event_details/ui/widgets/list_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InitialEventDetails extends StatelessWidget {
  const InitialEventDetails({
    super.key,
    required this.city,
    required this.country,
    required this.street,
    required this.startTime,
    required this.endTime,
    required this.minPrice,
    required this.maxPrice,
  });
  final DateTime startTime;
  final DateTime endTime;
  final String city;
  final String country;
  final String street;
  final int minPrice;
  final int maxPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomListTile(
          icon: Icons.calendar_month_rounded,
          title:
              '${DateFormat('EEEE').format(startTime)}, ${DateFormat('MMMM').format(startTime)}, ${startTime.day}, ${startTime.year}',
          subTitle: '${DateFormat('hh:mm a').format(startTime)}  - ${DateFormat('hh:mm a').format(endTime)}',
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTileButton(
          buttonText: 'Add to My Calendar',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomListTile(
          icon: Icons.place,
          title: '$city, $country',
          subTitle: '$street St., $city, $country.',
        ),
        const SizedBox(
          height: 10,
        ),
        const ListTileButton(
          buttonText: 'See Location on Maps',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomListTile(
          icon: Icons.confirmation_num,
          title: '\$${minPrice.toString()} - \$${maxPrice.toString()}',
          subTitle: 'Ticket price depends on package.',
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
