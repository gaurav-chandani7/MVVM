import 'package:flutter/material.dart';

class SortingButton extends StatelessWidget {
  const SortingButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.iconVisible,
      required this.iconData})
      : super(key: key);

  final void Function()? onPressed;
  final String buttonText;
  final bool iconVisible;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            Text(buttonText),
            Visibility(visible: iconVisible, child: Icon(iconData))
          ],
        ));
  }
}