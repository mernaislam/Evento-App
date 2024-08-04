import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.tabletLayout,
    required this.desktopLayout,
    required this.mobileLayout,
  });

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktopLayout(context);
        } else if (constraints.maxWidth >= 650) {
          return tabletLayout(context);
        } else {
          return mobileLayout(context);
        }
      }),
    );
  }
}