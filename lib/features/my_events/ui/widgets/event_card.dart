import 'package:cached_network_image/cached_network_image.dart';
import 'package:evento_app/core/helpers/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:evento_app/features/event_details/ui/screens/event_details_screen.dart';
import 'package:evento_app/features/event_integration/data/models/event_model.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.isCreator,
  });
  final Event event;
  final bool isCreator;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EventDetailsScreen(event: widget.event);
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
                    child: CachedNetworkImage(
                      imageUrl: widget.event.imagesUrl.isNotEmpty
                          ? widget.event.imagesUrl[0]
                          : '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Image.asset(
                        AppAssets.errorImage,
                        fit: BoxFit.cover,
                      ),
                      placeholder: (context, url) => Image.asset(
                        AppAssets.placeholderImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widget.isCreator
                      ? Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.white,
                            onPressed: () {},
                          ),
                        )
                      : const SizedBox(),
                ]),
              ),
              const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      widget.event.startTime.toString(),
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
                          '${widget.event.country}, ${widget.event.city}, ${widget.event.street}',
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
