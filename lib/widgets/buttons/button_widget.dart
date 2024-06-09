import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? borderRadius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  const ButtonWidget(
      {super.key,
        required this.onPressed,
        this.child,
        this.backgroundColor,
        this.foregroundColor,
        this.width,
        this.height,
        this.text,
        this.borderRadius,
        this.horizontalPadding,
        this.verticalPadding, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width ?? MediaQuery.of(context).size.width - 40,
      child: Expanded(child:  ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
          foregroundColor: foregroundColor ?? Colors.white,
          backgroundColor: backgroundColor ?? AppColors.green,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 20,
              vertical: verticalPadding ?? 10),
          child: child ??
              Text(
                text!,
                style: TextStyle(
                  fontSize: fontSize ?? (text!.length > 15 ? 17 : 20),
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),),
    );
  }
}
