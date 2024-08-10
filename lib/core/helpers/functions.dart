import 'package:flutter/material.dart';

void showSnackBar(String text, BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign:TextAlign.center,
          ),
        ),
      );
}