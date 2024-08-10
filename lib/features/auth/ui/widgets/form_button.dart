import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.isLoading,
  });
  final void Function()? onPressed;
  final String text;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          elevation: 5,
          shadowColor: Theme.of(context).primaryColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
