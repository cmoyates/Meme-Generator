import 'package:flutter/material.dart';

class PaddedButton extends StatelessWidget {
  const PaddedButton({Key key, this.onPressed, this.text}) : super(key: key);

  final onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
