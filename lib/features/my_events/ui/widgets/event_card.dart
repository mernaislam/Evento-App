import 'package:flutter/material.dart';
import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    // required this.event,
    required this.isCreator,
    required this.scale,
  });
  // final Event event;
  final bool isCreator;
  final double scale;

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
          width: MediaQuery.of(context).size.width * 0.45 * (widget.scale + 0.2),
          height: MediaQuery.of(context).size.height * 0.35 * (widget.scale - 0.25) ,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2 * widget.scale,
                child: Stack(fit: StackFit.expand, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(imageUrl,
                        fit: BoxFit.cover), //change to event.ImageUrl
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
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, //change to event.title
                    style: widget.scale == 1 ? Theme.of(context).textTheme.headlineSmall: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(),
                  Text(
                    date, //change to event.date
                    style: widget.scale == 1 ? Theme.of(context).textTheme.bodySmall: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(),
                  Row(children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).textTheme.bodySmall!.color,
                    ),
                    const SizedBox(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26 * widget.scale,
                      child: Text(
                        '$street, $city, $country', //change to event.address
                        style: widget.scale == 1 ? Theme.of(context).textTheme.labelSmall : Theme.of(context).textTheme.labelMedium,
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
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
