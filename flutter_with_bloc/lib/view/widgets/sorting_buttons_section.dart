import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_with_bloc/view/widgets/sorting_button.dart';
import 'package:flutter_with_bloc/view_model/bloc/country_bloc.dart';

class SortingButtonsSection extends StatelessWidget {
  const SortingButtonsSection({
    Key? key,
    required this.state,
    required this.notAppliedSorting,
  }) : super(key: key);

  final CountryState state;
  final bool notAppliedSorting;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SortingButton(
          onPressed: () {
            BlocProvider.of<CountryBloc>(context).add(SortCountries(
                sortBy: state is SortedByNameAsc || notAppliedSorting
                    ? SortBy.NAME_DSC
                    : SortBy.NAME_ASC));
          },
          buttonText: "Name",
          iconVisible:
              (state is SortedByNameAsc || state is SortedByNameDsc) ||
                  notAppliedSorting,
          iconData: state is SortedByNameAsc || notAppliedSorting
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
        ),
        SortingButton(
          onPressed: () {
            BlocProvider.of<CountryBloc>(context).add(SortCountries(
                sortBy: state is SortedByPopulationAsc
                    ? SortBy.POPULATION_DSC
                    : SortBy.POPULATION_ASC));
          },
          buttonText: "Population",
          iconVisible: (state is SortedByPopulationAsc ||
              state is SortedByPopulationDsc),
          iconData: state is SortedByPopulationAsc
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
        ),
        SortingButton(
          onPressed: () {
            BlocProvider.of<CountryBloc>(context).add(SortCountries(
                sortBy: state is SortedByAreaAsc
                    ? SortBy.AREA_DSC
                    : SortBy.AREA_ASC));
          },
          buttonText: "Area",
          iconVisible:
              (state is SortedByAreaAsc || state is SortedByAreaDsc),
          iconData: state is SortedByAreaAsc
              ? Icons.keyboard_arrow_up
              : Icons.keyboard_arrow_down,
        ),
      ],
    );
  }
}