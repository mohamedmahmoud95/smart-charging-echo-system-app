import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';


class AlertDialogWidget extends StatelessWidget {
  final String contentText;
  final String? title;
  final Widget? actionWidget;
  final VoidCallback? onPressed;

  const AlertDialogWidget(
      {super.key,
        required this.contentText,
        this.onPressed,
        this.title,
        this.actionWidget});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title ?? '',
     //   style: //bodyLargeTextStyle25,
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          contentText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
           // color: thinFontGrey,
            height: 1.5,
          ),
        ),
      ),
      actions: [
        actionWidget ??
            Padding(
              padding: EdgeInsets.all(8.0),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: Text("OK",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!.copyWith(color: Colors.white)),),

              ),

      ],
    );
  }
}
