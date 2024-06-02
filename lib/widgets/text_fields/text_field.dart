import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  bool? isHiddenByDefault;
  final bool? canBeVisible;
  final TextEditingController textController;
  TextFieldWidget({super.key, required this.label, this.prefix, this.suffix, this.isHiddenByDefault, this.canBeVisible, required this.textController});


  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool isHidden;
  @override
  void initState() {
    super.initState();
    isHidden = widget.isHiddenByDefault ?? false;
  }
  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        controller: widget.textController,
        obscureText: isHidden?? false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          prefix: widget.prefix ?? const SizedBox(),
          suffix: widget.suffix == null? const SizedBox() :

          widget.isHiddenByDefault == false? widget.suffix :
              GestureDetector(
                onTap: (){
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
                child: widget.suffix,
              ),


        ),
      ),
    );
  }
}
