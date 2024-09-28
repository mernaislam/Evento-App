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
    return LayoutBuilder(builder: (context, constraints) {
      final span = TextSpan(
        text: widget.description,
        style: Theme.of(context).textTheme.bodyLarge,
      );
      final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
      tp.layout(maxWidth: constraints.maxWidth);
      final numLines = tp.computeLineMetrics().length;

      if (numLines > 4) {
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
      } else {
        return Text(widget.description,
            style: Theme.of(context).textTheme.bodyLarge);
      }
    });
  }
}