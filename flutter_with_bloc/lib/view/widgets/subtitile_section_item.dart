import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_with_bloc/model/country.dart';
import 'package:flutter_with_bloc/view/widgets/subtitle_row_item.dart';

class SubtitleSection extends StatelessWidget {
  const SubtitleSection({super.key, required this.item});
  final Country item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SubtitleRowItem(
          iconData: CupertinoIcons.group_solid,
          text: k_m_b_generator(num: item.population),
        ),
        SubtitleRowItem(
          flex: 2,
          iconData: Icons.area_chart,
          text: "${k_m_b_generator(num: item.area, isArea: true)} km\u00B2",
        ),
        SubtitleRowItem(
          text: item.timezones!.join(", "),
          iconData: Icons.timer_outlined,
        ),
      ],
    );
  }

  String k_m_b_generator({dynamic num, isArea = false}) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)}${isArea ? ' thousand' : 'K'}";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)}${isArea ? ' thousand' : 'K'}";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)}${isArea ? ' million' : 'M'}";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)}${isArea ? ' billion' : 'B'}";
    } else {
      return num.toString();
    }
  }
}