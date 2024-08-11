import 'package:flutter/material.dart';

class BottomStickyButton extends StatelessWidget {
  const BottomStickyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 5,
              shadowColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Book Event',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
