import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });
  final IconData icon;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(padding: EdgeInsets.zero),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          radius: 30,
          child: Icon(
            Icons.calendar_month_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
