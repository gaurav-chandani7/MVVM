import 'package:flutter/material.dart';
import 'package:flutter_with_bloc/model/country.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Country item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name!.common ?? "",
              style: const TextStyle(fontSize: 18),
            ),
            (item.flags != null && item.flags!.png != null)
                ? Image.network(
                    item.flags!.png!,
                    width: 25,
                    height: 25,
                  )
                : const SizedBox()
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
