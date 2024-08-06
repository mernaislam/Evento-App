import 'package:evento_app/features/event_details/ui/widgets/custom_list_tile.dart';
import 'package:evento_app/features/event_details/ui/widgets/list_tile_button.dart';
import 'package:flutter/material.dart';

class InitialEventDetails extends StatelessWidget {
  const InitialEventDetails({
    super.key,
    required this.city,
    required this.country,
    required this.date,
    required this.street,
    required this.time,
    required this.minPrice,
    required this.maxPrice,
  });
  final String date;
  final String time;
  final String city;
  final String country;
  final String street;
  final double minPrice;
  final double maxPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // -------- Add Event Date here --------
        CustomListTile(
          icon: Icons.calendar_month_rounded,
          title: date,
          subTitle: time,
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
        // -------- Add Event Location here --------
        CustomListTile(
          icon: Icons.place,
          title: '$city, $country',
          subTitle: '$street, $city, $country.',
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
        // -------- Add Event Price here --------
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
