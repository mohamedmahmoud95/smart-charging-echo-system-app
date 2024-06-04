import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Widget? child;
  final String? text;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  const ButtonWidget({super.key, required this.onPressed, this.child, this.backgroundColor, this.foregroundColor, this.width, this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 50,
      width: width?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(onPressed: (){ onPressed(); },
    style: ElevatedButton.styleFrom(
      foregroundColor: foregroundColor??Colors.white,
      backgroundColor: backgroundColor??Colors.yellow.shade800,
    ), child: child?? Text(text!, style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),),
    );
  }
}
