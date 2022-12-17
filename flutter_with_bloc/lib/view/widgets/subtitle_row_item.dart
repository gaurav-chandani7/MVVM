import 'package:flutter/material.dart';

class SubtitleRowItem extends StatelessWidget {
  const SubtitleRowItem(
      {Key? key, required this.text, required this.iconData, this.flex = 1})
      : super(key: key);

  final String text;
  final IconData iconData;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: 20,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}