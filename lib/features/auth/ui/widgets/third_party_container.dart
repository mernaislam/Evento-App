import 'package:flutter/material.dart';

class ThirdPartyContainer extends StatelessWidget {
  const ThirdPartyContainer({
    super.key,
    required this.onTap,
    required this.child
  });
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.01),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.1),
          ),
        ),
        child: child,
      ),
    );
  }
}
