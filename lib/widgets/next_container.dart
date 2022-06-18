import 'package:flutter/material.dart';

class NextContainer extends StatelessWidget {
  const NextContainer({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor,
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
