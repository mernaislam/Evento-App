import 'package:flutter/material.dart';

class EventDescription extends StatefulWidget {
  const EventDescription({
    super.key,
    required this.description,
  });
  final String description;

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  bool _readMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _readMore
            ? Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            : Text(
                widget.description,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
        TextButton(
          onPressed: () {
            setState(() {
              _readMore = !_readMore;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          child: Text(
            'Read ${_readMore ? 'less' : 'more'}...',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        )
      ],
    );
  }
}
