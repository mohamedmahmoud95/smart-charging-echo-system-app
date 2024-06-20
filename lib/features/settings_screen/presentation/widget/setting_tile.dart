import 'package:flutter/material.dart';
import 'package:smart_charging_echo_system_app/core/theme/app_colors.dart';

class SettingTile extends StatefulWidget {
  final Widget leading;
  final String? titleText;
  final Widget? beforeTrailing;
  final Widget? trailing;
  final Widget? titleWidget;
  final VoidCallback onPressed;
  const SettingTile({Key? key, required this.leading, this.titleText, this.beforeTrailing, this.trailing, required this.onPressed, this.titleWidget}) : super(key: key);

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child:
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    // decoration: ShapeDecoration(
                    //   color: AppColors.textGrey,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    // ),
                    // child:
                    //
                    //
                    // Padding(padding: const EdgeInsets.all(4.0),
                        child: SizedBox(height: 10, width: 10, child: widget.leading)),
                 // ),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.titleText == null
                      ? const SizedBox()
                      : Text(
                    widget.titleText!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color:  Colors.black,
                    ),
                  ),
                  widget.titleWidget == null ? const SizedBox() : widget.titleWidget!,
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.beforeTrailing ?? const SizedBox(),
                  const SizedBox(
                    width: 10,
                  ),
                  widget.trailing ??
                       Container(),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}