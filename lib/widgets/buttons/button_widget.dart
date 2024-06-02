import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  const ButtonWidget({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){ onPressed(); }, child: child);
  }
}
