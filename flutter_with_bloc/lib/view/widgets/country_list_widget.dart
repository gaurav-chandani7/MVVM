import 'package:flutter/material.dart';
import 'package:flutter_with_bloc/view/widgets/sorting_buttons_section.dart';
import 'package:flutter_with_bloc/view/widgets/subtitile_section_item.dart';
import 'package:flutter_with_bloc/view/widgets/title_section_item.dart';
import 'package:flutter_with_bloc/view_model/bloc/country_bloc.dart';

class CountryListWidget extends StatelessWidget {
  const CountryListWidget({super.key, required this.state});

  final CountryState state;

  @override
  Widget build(BuildContext context) {
    var data = state.countryList ?? [];
    bool notAppliedSorting = (state is! SortedByAreaAsc &&
        state is! SortedByAreaDsc &&
        state is! SortedByNameAsc &&
        state is! SortedByNameDsc &&
        state is! SortedByPopulationAsc &&
        state is! SortedByPopulationDsc);
    return Material(
      child: Column(
        children: [
          SortingButtonsSection(
              state: state, notAppliedSorting: notAppliedSorting),
          const SizedBox(
            height: 2,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: TitleSection(item: data[index]),
                subtitle: SubtitleSection(
                  item: data[index],
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
