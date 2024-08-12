import 'package:flutter/material.dart';
import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    // required this.event,
    required this.isCreator,
  });
  // final Event event;
  final bool isCreator;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  // static data till merging
  String title = 'My Birthday';
  String street = 'St. 100';
  String city = 'New York';
  String country = 'United States';
  String imageUrl =
      'https://cdn.pixabay.com/photo/2020/01/15/17/38/fireworks-4768501_640.jpg';
  String date = 'Mon, Dec 24 . 6.00 PM';

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const EventDetailsScreen(); //change to EventDetailsScreen(event: event)
          }));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 14,
                child: Stack(fit: StackFit.expand, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrl, // Change to event.imageUrl
                      fit: BoxFit.cover,
                    ),
                  ),
                  widget.isCreator
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.white,
                            onPressed: () {
                              // navigate to edit event screen
                            },
                          ),
                        )
                      : const SizedBox(),
                ]),
              ),
              // ),
              const SizedBox(),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      title, //change to event.title
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      date, //change to event.date
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).textTheme.bodySmall!.color,
                      ),
                      const SizedBox(),
                      Flexible(
                        flex: 3,
                        child: Text(
                          '$street, $city, $country', //change to event.address
                          style: Theme.of(context).textTheme.titleSmall!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(),
                      !widget.isCreator
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: isFavorite
                                  ? Icon(Icons.favorite,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color)
                                  : Icon(Icons.favorite_border,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color))
                          : const SizedBox(),
                    ]),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
